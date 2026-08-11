output "instance_public_ip" {
  value = aws_instance.web.public_ip
}

output "web_url" {
  value = "http://${aws_instance.web.public_ip}"
}

output "ssh_allowed_cidr" {
  value = local.ssh_cidr
}