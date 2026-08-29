variable "aws_region" {
  description = "Regiao onde os recursos serao criados"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "meu_ip_cidr" {
  description = "CIDR do seu IP publico, no formato IP/32, autorizado a acessar a porta 22. Deixe vazio para usar o IP atual automaticamente."
  type        = string
  default     = ""
}

variable "aluno_name" {
  type    = string
  default = "Marcos Vinicius"
}

variable "turma" {
  type    = string
  default = "Turma-IaC"
}

variable "project_name" {
  type    = string
  default = "getting-started-app"
}
variable "key_name" {
  description = "Nome da chave SSH da instância EC2."
  type        = string
  default     = "getting-started-app"
}

variable "public_key_path" {
  description = "Caminho da chave pública SSH local."
  type        = string
  default     = "/home/marcos/.ssh/getting-started-app.pub"
}