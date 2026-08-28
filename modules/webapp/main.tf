locals {
  common_tags = {
    Name     = "getting-started-app-${terraform.workspace}"
    Project  = var.project_name
    Ambiente = terraform.workspace
  }
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = merge(local.common_tags, {
    Name = "vpc-getting-started-app-${terraform.workspace}"
  })
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.common_tags, {
    Name = "igw-getting-started-app-${terraform.workspace}"
  })
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  availability_zone       = data.aws_availability_zones.available.names[0]
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-publica-getting-started-app"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(local.common_tags, {
    Name = "rt-public-getting-started-app-${terraform.workspace}"
  })
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "web" {
  name        = "web-sg-atividade-${terraform.workspace}"
  description = "Permite HTTP publico e SSH so do IP do aluno"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH autorizado apenas ao IP do aluno"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.meu_ip_cidr]
  }

  ingress {
    description = "Aplicacao getting-started-app"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "sg-web-getting-started-app-${terraform.workspace}"
  })
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web.id]
  key_name                    = aws_key_pair.web.key_name

  tags = merge(local.common_tags, {
    Name = "ec2-web-getting-started-app-${terraform.workspace}"
  })
}

resource "aws_key_pair" "web" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}
