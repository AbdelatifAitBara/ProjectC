resource "aws_route53_record" "alias_route53_record" {
  zone_id = "Z05857851QWH8AHXPR6J6"
  name    = "projetc.abdelatif-aitbara.link"
  type    = "A"

  alias {
    name                   = aws_lb.abdelatif-alb.dns_name
    zone_id                = aws_lb.abdelatif-alb.zone_id
    evaluate_target_health = true
  }
}

# Resource For Jenkins EC2 Instance

resource "aws_route53_record" "jenkins_route53_record" {
  zone_id = "Z05857851QWH8AHXPR6J6"
  name    = "jenkins.abdelatif-aitbara.link"
  type    = "A"

  alias {
    name                   = data.aws_instance.ec2_jenkins.public_dns
    zone_id                = "Z05857851QWH8AHXPR6J6"
    evaluate_target_health = true
  }
}