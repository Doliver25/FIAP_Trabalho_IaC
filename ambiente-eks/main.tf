module "nosso_eks" {
  source       = "../modules/eks" # Chamando o módulo
  cluster_name = "nosso_eks"
}