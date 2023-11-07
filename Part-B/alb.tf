resource "aws_lb" "abdelatif-alb" {

  name               = "abdelatif-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = [aws_subnet.PublicSubnet01.id, aws_subnet.PublicSubnet02.id]

  tags = {
    Name = "abdelatif-alb"
    owner = local.tags.owner
    ephemere = local.tags.ephemere
    entity = local.tags.entity
  }
}

resource "aws_lb_target_group" "abdelatif-tg" {
  name     = "abdelatif-tg"
  target_type = "instance"
  port     = 32000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/healthz"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 5
    timeout             = 20
    healthy_threshold   = 2
    unhealthy_threshold = 10
  }

  tags = {
    Name = "abdelatif-tg"
    owner = local.tags.owner
    ephemere = local.tags.ephemere
    entity = local.tags.entity
    }
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_eks_node_group.private-nodes.resources[0].autoscaling_groups[0].name
  lb_target_group_arn    = aws_lb_target_group.abdelatif-tg.arn

  depends_on = [
    aws_eks_node_group.private-nodes
  ]
}

resource "aws_lb_listener" "abdelatif-lb-listener" {
  load_balancer_arn = aws_lb.abdelatif-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.abdelatif-tg.arn
  }

  tags = {
    Name = "abdelatif-lb-listener"
    owner = local.tags.owner
    ephemere = local.tags.ephemere
    entity = local.tags.entity
  }
}

