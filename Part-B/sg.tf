# Create a SG for Load Balancer:
resource "aws_security_group" "alb-sg" {
  name        = "Abdelatif-ALB-SG"
  description = "Abdelatif ALB SG"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name     = "Abdelatif-alb-sg"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}

# Create a SG for EKS:


resource "aws_security_group_rule" "allow_alb_to_eks" {
  type              = "ingress"
  from_port         = 32000
  to_port           = 32001
  protocol          = "-1"
  source_security_group_id = aws_security_group.alb-sg.id
  security_group_id     = [aws_eks_cluster.K8sCluster.vpc_config[0].cluster_security_group_id]
}

