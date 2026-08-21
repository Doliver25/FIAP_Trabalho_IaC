# Saídas disponibilizadas para uso nos outros módulos
output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.main.id
}
 
output "subnet_id" {
  description = "ID da Subnet publica criada"
  value       = aws_subnet.public.id
}