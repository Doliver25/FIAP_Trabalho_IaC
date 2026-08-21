variable "vpc_id" {
  description = "ID da VPC onde o SG sera criado"
  type        = string
}
 
variable "environment" {
  description = "Nome do ambiente"
  type        = string
}