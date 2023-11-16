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

resource "aws_security_group" "eks_cluster" {
  name        = "Abdelatif-EKS-SG"
  description = "Allow pods to communicate with each other"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group_rule" "allow_alb_to_eks" {
  type              = "ingress"
  from_port         = 32000
  to_port           = 32001
  protocol          = "-1"
  source_security_group_id = aws_security_group.alb-sg.id
  security_group_id = aws_security_group.eks_cluster.id
}


# Create node group security group
resource "aws_security_group" "node_group_sg" {
  name        = "Abdelatif-Node_Group_SG"
  description = "Security group for EKS node group"
  vpc_id      = var.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


resource "aws_security_group_rule" "cluster_to_node_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id = aws_security_group.eks_cluster.id
  security_group_id = aws_security_group.node_group_sg.id
}

