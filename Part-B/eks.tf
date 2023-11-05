resource "aws_eks_cluster" "K8sCluster" {
  name     = "Abdelatif-K8sCluster"
  role_arn = var.eks-iam-role

  vpc_config {
    subnet_ids = [
      aws_subnet.PrivateSubnet01.id,
      aws_subnet.PrivateSubnet02.id
    ]
  }

  tags = {
    Name     = "Abdelatif-K8sCluster"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}
