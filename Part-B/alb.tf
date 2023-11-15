resource "aws_lb" "abdelatif-alb" {

  name               = "Abdelatif-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = [aws_subnet.PublicSubnet01.id, aws_subnet.PublicSubnet02.id]

  tags = {
    Name     = "Abdelatif-ALB"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}

resource "aws_lb_target_group" "abdelatif-tg-HTTP" {
  name        = "Abdelatif-TG-HTTP"
  target_type = "instance"
  port        = 32000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/healthz"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }

  tags = {
    Name     = "Abdelatif-TG-HTTP"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}

# Add the same TG but on HTTPS:

resource "aws_lb_target_group" "abdelatif-tg-HTTPS" {
  name        = "Abdelatif-TG-HTTPS"
  target_type = "instance"
  port        = 32001
  protocol    = "HTTPS"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/healthz"
    protocol            = "HTTPS"
    matcher             = "200"
    interval            = 15
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }

  tags = {
    Name     = "Abdelatif-TG-HTTPS"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}

resource "aws_autoscaling_attachment" "asg_attachment1" {
  autoscaling_group_name = aws_eks_node_group.private-nodes.resources[0].autoscaling_groups[0].name
  lb_target_group_arn    = aws_lb_target_group.abdelatif-tg-HTTP.arn

  depends_on = [
    aws_eks_node_group.private-nodes
  ]
}

resource "aws_autoscaling_attachment" "asg_attachment2" {
  autoscaling_group_name = aws_eks_node_group.private-nodes.resources[0].autoscaling_groups[0].name
  lb_target_group_arn    = aws_lb_target_group.abdelatif-tg-HTTPS.arn

  depends_on = [
    aws_eks_node_group.private-nodes
  ]
}

resource "aws_lb_listener" "abdelatif-lb-listener-http" {
  load_balancer_arn = aws_lb.abdelatif-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.abdelatif-tg-HTTP.arn
  }

  tags = {
    Name     = "abdelatif-lb-listener-http"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}

resource "aws_lb_listener" "abdelatif-lb-listener-https" {
  load_balancer_arn = aws_lb.abdelatif-alb.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.abdelatif-tg-HTTPS.arn
  }

  tags = {
    Name     = "abdelatif-lb-listener-https"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}