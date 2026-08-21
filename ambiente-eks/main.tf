module "nosso_eks" {
  source       = "../Module/eks" # Chamando o módulo
  cluster_name = "nosso_eks"
}