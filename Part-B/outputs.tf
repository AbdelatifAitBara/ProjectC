# Vault EC2 OUTPUTS
output "ec2_monitoring_ip" {
  value = aws_instance.ec2_monitoring.public_ip
}