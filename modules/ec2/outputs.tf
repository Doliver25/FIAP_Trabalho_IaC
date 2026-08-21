output "ec2_public_ip" {
  description = "IP Publico da maquina virtual"
  value       = aws_instance.app_server.public_ip
}