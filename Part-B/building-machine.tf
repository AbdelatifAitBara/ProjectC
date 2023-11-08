# Deploy auto scaling group For My Building Machine

resource "aws_launch_configuration" "alc" {
  name            = "Abdelatif-BM"
  image_id        = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.bm-sg.id]
  user_data       = data.template_file.bm_user_data.rendered
  key_name        = var.ec2_key_name
}


resource "aws_autoscaling_group" "abdelatif-bm-asg" {
  name                  = "Abdelatif-BM-ASG"
  launch_configuration = aws_launch_configuration.alc.name
  vpc_zone_identifier  = [aws_subnet.PublicSubnet01.id, aws_subnet.PublicSubnet02.id]

  target_group_arns = [aws_lb_target_group.abdelatif-tg.arn]
  health_check_type = "EC2"

  min_size         = 2
  max_size         = 4
  desired_capacity = 2

}
