resource "aws_eks_cluster" "K8sCluster" {
  name     = var.eks_cluster_name
  role_arn = var.eks-iam-role

  vpc_config {
    subnet_ids = [
      aws_subnet.PrivateSubnet01.id,
      aws_subnet.PrivateSubnet02.id
    ]
    endpoint_private_access = true
    endpoint_public_access  = false
  }
  tags = {
    Name     = "Abdelatif-K8sCluster"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}
