variable "project_name" {
  description = "Nome do projeto usado para tags e identificacao dos recursos."
  type        = string
}

variable "aws_region" {
  description = "Regiao AWS onde os recursos serao criados."
  type        = string
}

variable "meu_ip_cidr" {
  description = "CIDR do seu IP publico, no formato IP/32, autorizado a acessar a porta 22."
  type        = string
}

variable "aluno_nome" {
  description = "Nome do aluno para exibir na pagina web."
  type        = string
}

variable "turma" {
  description = "Identificacao da turma para exibir na pagina web."
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2 a ser criada."
  type        = string
}
