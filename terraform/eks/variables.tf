variable "eks_admin_role_arn" {
  type = string
}

variable "nodes_admin_role_arn" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "public_subnet_ids" {
  type = list(string)
}