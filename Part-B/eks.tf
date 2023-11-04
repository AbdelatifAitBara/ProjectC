resource "aws_eks_cluster" "K8sCluster" {
  name     = "Abdelatif-K8sCluster"
  role_arn = var.eks-iam-role

  vpc_config {
    subnet_ids = [
      aws_subnet.PublicSubnet01.id
    ]
  }

  tags = {
    Name     = "Abdelatif-K8sCluster"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}
