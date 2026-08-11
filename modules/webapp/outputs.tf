output "instance_id" {
  description = "ID da instancia EC2 criada."
  value       = aws_instance.web.id
}

output "instance_public_ip" {
  description = "Endereco IP publico da instancia EC2."
  value       = aws_instance.web.public_ip
}

output "instance_public_dns" {
  description = "DNS publico da instancia EC2."
  value       = aws_instance.web.public_dns
}

output "web_url" {
  description = "URL de acesso publico para a pagina web."
  value       = "http://${aws_instance.web.public_ip}"
}
