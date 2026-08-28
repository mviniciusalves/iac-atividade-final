# Projeto Final: Terraform + Ansible

Projeto para provisionamento e configuração de uma aplicação Docker na AWS.

## Fluxo

```text
Terraform → EC2 → Ansible via SSH → Docker → Aplicação na porta 3000
```

## Terraform

Inicializar:

```bash
terraform init
```

Criar os ambientes:

```bash
terraform workspace new dev
terraform workspace new prod
terraform workspace select dev
```

Provisionar a infraestrutura:

```bash
terraform validate
terraform plan
terraform apply
```

O Terraform cria a VPC, subnet pública, Internet Gateway, Security Group, chave SSH e uma EC2 `t3.micro`.

## Ansible

Após o `terraform apply`, atualize o IP da EC2 (Ver em Outputs) em `ansible/inventory.ini`:

```ini
[web]
app ansible_host=IP_PUBLICO_DA_EC2
```

Execute o playbook:

```bash
cd ansible
ansible-playbook -i inventory.ini playbook.yml --ask-vault-pass
```
Vault password enviada via comentário privado no Classroom.
O Ansible instala o Docker e executa o container `getting-started-app`, mapeando a porta `3000` da EC2 para a porta `80` do container.

## Ansible Vault

A variável sensível simulada está protegida no arquivo `ansible/vault.yml`.

## Teste

```bash
curl http://IP_PUBLICO_DA_EC2:3000
```

A segunda execução do Ansible foi idempotente:

```text
changed=0
failed=0
```

## Destruição

```bash
cd ..
terraform workspace select dev
terraform destroy
```

Os arquivos `terraform.tfvars`, a chave privada SSH e a senha do Vault não são enviados ao repositório.