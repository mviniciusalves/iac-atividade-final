terraform {
  required_version = ">= 1.5.0"

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

module "webapp" {
  source = "./modules/webapp"

  aws_region    = var.aws_region
  instance_type = var.instance_type
  meu_ip_cidr   = var.meu_ip_cidr
  aluno_nome    = var.aluno_name
  turma         = var.turma
  project_name  = var.project_name
}
