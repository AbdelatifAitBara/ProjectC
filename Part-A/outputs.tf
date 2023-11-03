# Jenkins EC2 OUTPUTS

output "ec2_jenkins_ip" {
  value = aws_instance.ec2_jenkins.public_ip
}

# Ansible EC2 OUTPUTS

output "ec2_ansible_ip" {
  value = aws_instance.ec2_ansible.public_ip
}


# Vault EC2 OUTPUTS

output "ec2_vault_ip" {
  value = aws_instance.ec2_vault.private_ip
}