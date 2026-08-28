# iac-atividade-01
Repositório para atividade 01 da disciplina IaC

Esta configuracao provisiona a infraestrutura minima na AWS para hospedar uma pagina web simples.

# Bucket
O projeto deve declarar um backend s3 criado manualmente:

pos-devops-iac-tfstate-marcos

## Como usar

1. Inicialize o projeto:

   terraform init

2. Rode o plano e aplique:

   terraform plan
   terraform apply

## Destruir recursos

   terraform destroy

#Ansible

Inventário estático
Se a instância for recriada e o IP mudar, atualize o endereço em ansible/inventory.ini.
---