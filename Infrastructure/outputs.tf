# Jenkins EC2 OUTPUTS

output "ec2_jenkins_ip" {
  value = aws_instance.ec2_jenkins.public_ip
}

