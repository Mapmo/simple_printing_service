resource "aws_eks_node_group" "private_nodes" {
  cluster_name    = aws_eks_cluster.simple_service.name
  node_group_name = "private_nodes"
  node_role_arn   = var.nodes_admin_role_arn

  subnet_ids = var.private_subnet_ids

  capacity_type  = "ON_DEMAND"
  instance_types = ["t2.micro"]

  scaling_config {
    desired_size = 2
    max_size     = 5
    min_size     = 0
  }

  update_config {
    max_unavailable = 1
  }
}