terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  instance_type_por_workspace = {
    default = "t2.micro"
    dev     = "t2.micro"
    prod    = "t3.micro"
  }

  instance_type = lookup(local.instance_type_por_workspace, terraform.workspace, "t2.micro")
}

module "webapp" {
  source = "./modules/webapp"

  project_name  = "atividade-web"
  aws_region    = var.aws_region
  meu_ip_cidr   = var.meu_ip_cidr
  aluno_nome    = var.aluno_nome
  turma         = var.turma
  instance_type = local.instance_type
}
