
# 1. Criando o Módulo de VPC
module "vpc" {
  source      = "../Module/vpc" # Chamando o módulo

  vpc_cidr    = "192.168.100.0/23"
  subnet_cidr = "192.168.100.0/24"
  subnet_cidr_private = "192.168.101.0/24"
  environment = "homolocacao"
}
 
# 2. Consome o Módulo de Security Group (passa o vpc_id gerado pelo módulo de VPC)
module "sg" {
  source      = "../Module/sg"
  vpc_id      = module.vpc.vpc_id
  environment = "homolocacao"
}

# 3. Consome o Módulo da EC2 (passa a subnet_id e security_group_id dos módulos anteriores)
module "ec2" {
  source            = "../Module/ec2"
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.sg.security_group_id
  instance_type     ="t2.micro"
  environment = "homolocacao"
}

# 3. Consome o Módulo da EC2 (passa a subnet_id e security_group_id dos módulos anteriores)
module "ec2_qa" {
  source            = "../Module/ec2"
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.sg.security_group_id
  instance_type     ="t3.micro"
  environment = "qa"
}

# 3. Consome o Módulo da EC2 (passa a subnet_id e security_group_id dos módulos anteriores)
module "ec2_dev" {
  source            = "../Module/ec2"
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.sg.security_group_id
  environment = "dev"
}