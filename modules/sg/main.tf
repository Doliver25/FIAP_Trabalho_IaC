# ==============================================================================
# MÓDULO SECURITY GROUP: Regras de Firewall
# ==============================================================================
 
resource "aws_security_group" "allow_ssh_http" {
  name        = "${var.environment}-sg"
  description = "Permite trafego de entrada SSH (22) e HTTP (80)"
  vpc_id      = var.vpc_id # Recebe o ID da VPC gerado no módulo de rede
 
  # Entrada para conexões SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Acesso universal
  }
 
  # Entrada para tráfego web HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Acesso universal
  }
 
  # Saída totalmente liberada
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # '-1' habilita todos os protocolos de saída
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  tags = {
    Name = "${var.environment}-sg"
  }
}