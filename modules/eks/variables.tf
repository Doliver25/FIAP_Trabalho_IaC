# Variáveis
variable "cluster_name" {
  type = string
  default = "eks-cluster"
  description = "Nosso EKS"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
  description = "CIDR da VPC"
}

variable "availability_zones" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "Lista de Availability Zones"
}

variable "private_subnet_cidrs" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "Lista de CIDRs das sub-redes privadas"
}

variable "public_subnet_cidrs" {
  type = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  description = "Lista de CIDRs das sub-redes públicas"
}

variable "eks_version" {
  type = string
  default = "1.36"
  description = "Versão do Kubernetes"
}

variable "desired_size" {
  type = number
  default = 2
  description = "Tamanho desejado do Node Group"
}

variable "max_size" {
  type = number
  default = 3
  description = "Tamanho máximo do Node Group"
}

variable "min_size" {
  type = number
  default = 1
  description = "Tamanho mínimo do Node Group"
}