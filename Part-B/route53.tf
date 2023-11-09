resource "aws_route53_record" "alias_route53_record" {
  zone_id = "Z05857851QWH8AHXPR6J6"
  name    = "projectc.abdelatif-aitbara.link"
  type    = "A"

  alias {
    name                   = aws_lb.abdelatif-alb.dns_name
    zone_id                = aws_lb.abdelatif-alb.zone_id
    evaluate_target_health = true
  }
}