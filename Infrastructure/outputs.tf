# Jenkins EC2 OUTPUTS

output "ec2_jenkins_ip" {
  value = aws_instance.ec2_jenkins.public_ip
}


output "ec2_ansible_id" {
  value = data.aws_instance.ec2_ansible.id
}
