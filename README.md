# iac-atividade-01
Repositório para atividade 01 da disciplina IaC

Esta configuracao provisiona a infraestrutura minima na AWS para hospedar uma pagina web simples.

# Bucket
O projeto deve declarar um backend s3 criado manualmente:

pos-devops-iac-tfstate-marcos

## Como usar

1. Inicialize o projeto:

   terraform init

2. Crie/selecionar workspaces:

   terraform workspace new dev
   terraform workspace select dev

   terraform workspace new prod
   terraform workspace select prod

3. Rode o plano e aplique:

   terraform plan
   terraform apply

4. Acesse a pagina web usando o output `web_url`:

   terraform output web_url

## Destruir recursos

Para destruir em cada workspace:

   terraform workspace select dev
   terraform destroy

   terraform workspace select prod
   terraform destroy
