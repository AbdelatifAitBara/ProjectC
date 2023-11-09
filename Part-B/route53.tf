resource "aws_route53_record" "www" {
  zone_id = "Z05857851QWH8AHXPR6J6"
  name    = "www.abdelatif-aitbara.link"
  type    = "A"
  ttl     = 300
  records = [aws_lb.abdelatif-alb.dns_name]
}
