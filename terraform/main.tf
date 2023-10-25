module "iam" {
  source = "./iam"
}

module "networking" {
  source = "./networking"
}

module "eks" {
  source               = "./eks"
  eks_admin_role_arn   = module.iam.eks_admin_role_arn
  nodes_admin_role_arn = module.iam.nodes_admin_role_arn
  subnet_ids           = module.networking.subnet_ids
  private_subnet_ids   = module.networking.private_subnet_ids
  public_subnet_ids    = module.networking.public_subnet_ids
}