terraform {
  backend "s3" {
    bucket = "pos-devops-iac-tfstate-marcos"
    key    = "07-atividade-web/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}
