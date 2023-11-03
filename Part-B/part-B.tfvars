vpc_id = "vpc-03a8dde6447237b08"
igw_id = "igw-0501e3106a83b2af0"

# EC2 Defaults Values:

ami            = "ami-0694d931cee176e7d"
instance_type  = "t2.micro"
volume_type    = "gp3"
volume_size    = 8
ec2_key_name   = "Abdelatif-KeyPair"
terraform_role = "terraform-iam-role"

# SG Default Values:

# Ansible:

sg_ansible_name       = "Abdelatif-EC2-02-SG"
sg_ansible_descrption = "Abdelatif EC2 02 Security Group"

# Vault:

sg_vault_name       = "Abdelatif-EC2-03-SG"
sg_vault_descrption = "Abdelatif EC2 03 Security Group"

# Monitoring

sg_monitoring_name       = "Abdelatif-EC2-04-SG"
sg_monitoring_descrption = "Abdelatif EC2 04 Security Group"

# Network Defaults Values:

cidr_block_PublicSubnet01  = "10.0.1.0/24"
cidr_block_PrivateSubnet01 = "10.0.2.0/24"
cidr_block_PrivateSubnet02 = "10.0.3.0/24"
az-a                       = "eu-west-1a"
