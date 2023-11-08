# Create a SG for Load Balancer:

resource "aws_security_group" "alb-sg" {
  name        = "abdelatif-alb-sg"
  description = "Abdelatif ALB SG"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
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

# Create a sg for Building Machine ASG:


resource "aws_security_group" "bm-sg" {
  name        = var.sg-bm-name
  description = var.sg-bm-description
  vpc_id      = var.vpc_id


  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}


# Create a sg for Monitoring instance:
