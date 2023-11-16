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
  ingress = {
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


# Create node group security group
resource "aws_security_group" "node_group_sg" {
  name        = "Abdelatif-Node_Group_SG"
  description = "Security group for EKS node group"
  vpc_id      = var.vpc_id
}

# Create EKS cluster security group
resource "aws_security_group" "cluster_sg" {
  name        = "Abdelatif-Cluster_SG" 
  description = "Security group for EKS cluster"
  vpc_id      = var.vpc_id

  # Cluster ingress rules

  ingress {
    from_port   = 32000
    to_port     = 30001
    protocol    = "-1"
    cidr_blocks = [aws_security_group.alb-sg.id]
  }

  # Cluster egress rules
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
  source_security_group_id = aws_security_group.cluster_sg.id
  security_group_id = aws_security_group.node_group_sg.id
}

