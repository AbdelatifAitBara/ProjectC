resource "aws_eks_cluster" "K8sCluster" {
  name     = var.eks_cluster_name
  role_arn = var.eks-iam-role

  vpc_config {
    subnet_ids = [
      aws_subnet.PublicSubnet01.id,
      aws_subnet.PublicSubnet02.id
    ]

    endpoint_private_access = true
    endpoint_public_access  = false
  }

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  tags = {
    Name     = "Abdelatif-K8sCluster"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}
