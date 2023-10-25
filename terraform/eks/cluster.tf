resource "aws_eks_cluster" "simple_service" {
  name     = "simple_service"
  role_arn = var.eks_admin_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}