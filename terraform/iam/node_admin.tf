data "aws_iam_policy_document" "nodes_admin" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role" "nodes_admin" {
  name = "eks-node-group-nodes"

  assume_role_policy = data.aws_iam_policy_document.nodes_admin.json
}

resource "aws_iam_role_policy_attachment" "nodes_admin_AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodes_admin.name
}

resource "aws_iam_role_policy_attachment" "nodes_admin_AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodes_admin.name
}

resource "aws_iam_role_policy_attachment" "EC2InstanceProfileForImageBuilderECRContainerBuilds" {
  policy_arn = "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
  role       = aws_iam_role.nodes_admin.name
}

resource "aws_iam_role_policy_attachment" "nodes_admin_AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodes_admin.name
}

output "nodes_admin_role_arn" {
  value = aws_iam_role.nodes_admin.arn
}