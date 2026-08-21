# ==============================================================================
# MÓDULO VPC: Recursos de Rede (VPC, Subnet, Internet Gateway e Tabela de Roteamento)
# ==============================================================================
 
# Criação da VPC isolada
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr # Bloco de IPs da rede principal (ex: 10.0.0.0/16)
  enable_dns_hostnames = true         # Permite nomes DNS privados para as instâncias
 
  tags = {
    Name = "${var.environment}-vpc"
  }
}
 
# Subnet pública vinculada à VPC
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id # ID recebido da VPC acima
  cidr_block              = var.subnet_cidr # Bloco de IPs da sub-rede (ex: 10.0.1.0/24)
  map_public_ip_on_launch = true            # Atribui automaticamente IP público na inicialização
 
  tags = {
    Name = "${var.environment}-public-subnet"
  }
}

# Subnet private vinculada à VPC
resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.main.id # ID recebido da VPC acima
  cidr_block              = var.subnet_cidr_private # Bloco de IPs da sub-rede (ex: 10.0.1.0/24)
  tags = {
    Name = "${var.environment}-private-subnet"
  }
}
 
# Internet Gateway para liberar tráfego externo
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
 
  tags = {
    Name = "${var.environment}-igw"
  }
}
 
# Tabela de Roteamento direcionando tráfego de saída ao Internet Gateway
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
 
  route {
    cidr_block = "0.0.0.0/0"                # Rota default para a internet
    gateway_id = aws_internet_gateway.gw.id # Encaminha para o Gateway
  }
}

# Tabela de Roteamento privados
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
 
  tags = {
    Name = "${var.environment}-private-rt"
  }
}
 
# Associação da tabela de roteamento à Subnet pública
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# Associação da tabela de roteamento à Subnet privada
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
}
