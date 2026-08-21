# Parâmetros aceitos pelo módulo de rede
variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}
 
variable "subnet_cidr" {
  description = "Bloco CIDR da Subnet publica"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_cidr_private" {
  description = "Bloco CIDR da Subnet private"
  type        = string
  default     = "10.0.2.0/24"
}
 
variable "environment" {
  description = "Nome do ambiente para padronizacao de tags"
  type        = string
}
