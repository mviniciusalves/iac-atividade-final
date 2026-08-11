variable "aws_region" {
  description = "Regiao onde os recursos serao criados"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "my_ip_cidr" {
  description = "CIDR do seu IP publico, no formato IP/32, autorizado a acessar a porta 22"
  type        = string
  default     = "192.168.1.1/32"
}

variable "name" {
  type        = string
  default = "Marcos Vinicius"
}

variable "class" {
  type        = string
  default = "Turma-IaC"
}
