
resource "aws_eks_node_group" "private-nodes" {

  cluster_name    = aws_eks_cluster.K8sCluster.name
  node_group_name = "Abdelatif-private-nodes"
  node_role_arn   = var.node-iam-role

  subnet_ids = [
    aws_subnet.PrivateSubnet01.id,
    aws_subnet.PrivateSubnet02.id
  ]

  capacity_type  = "ON_DEMAND"
  instance_types = ["t2.micro"]

  scaling_config {
    desired_size = 2
    max_size     = 6
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "general"
  }

  tags = {
    Name     = "Abdelatif-Private-Nodes"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity 
  }

}