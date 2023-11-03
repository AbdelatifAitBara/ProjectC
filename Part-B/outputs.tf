# Vault EC2 OUTPUTS

output "ec2_vault_ip" {
  value = aws_instance.ec2_vault.public_ip
}