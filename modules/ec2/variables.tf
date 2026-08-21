variable "instance_type" {
  description = "Tipo da instancia EC2"
  type        = string
  default     = "t2.micro"
}
 
variable "subnet_id" {
  description = "ID da subnet publica"
  type        = string
}
 
variable "security_group_id" {
  description = "ID do Security Group"
  type        = string
}
 
variable "environment" {
  description = "Nome do ambiente"
  type        = string
}