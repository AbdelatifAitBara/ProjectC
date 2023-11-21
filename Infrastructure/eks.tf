resource "aws_eks_cluster" "K8sCluster" {
  name     = var.eks_cluster_name
  role_arn = var.eks-iam-role

  vpc_config {
    subnet_ids = [
      aws_subnet.PublicSubnet01.id,
      aws_subnet.PublicSubnet02.id
    ]
    endpoint_private_access = true
    public_access_cidrs = data.aws_instance.ec2_bastion.public_ip
  }
  tags = {
    Name     = "Abdelatif-K8sCluster"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}
