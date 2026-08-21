# ==============================================================================
# MÓDULO EC2: Instância de Servidor
# ==============================================================================
 
# Busca dinâmica da imagem (AMI) oficial Amazon Linux 2023 mais recente
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
 
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}
 
# Provisionamento da máquina virtual EC2
resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id               # ID da subnet vindo do módulo VPC
  vpc_security_group_ids = [var.security_group_id]    # ID do SG vindo do módulo SG
 
  tags = {
    Name = "${var.environment}-ec2"
  }
}