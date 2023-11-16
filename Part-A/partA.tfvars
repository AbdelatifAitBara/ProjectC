vpc_id           = "vpc-0f0186dfaa776d811"
igw_id           = "igw-05d827b8859292043"
public_subnet_1  = "subnet-0b1a0d86072dd7cc8"
private_subnet_1 = "subnet-052aa5cadf1e725b7"

# EC2 Defaults Values:

ami            = "ami-0694d931cee176e7d"
instance_type  = "t2.micro"
volume_type    = "gp3"
volume_size    = 8
ec2_key_name   = "Abdelatif-KeyPair"
terraform_role = "terraform-iam-role"

# SG Default Values:

# Jenkins

sg_jenkins_name       = "Abdelatif-EC2-01-SG"
sg_jenkins_descrption = "Abdelatif EC2 01 Security Group"

# Ansible:

sg_ansible_name       = "Abdelatif-EC2-02-SG"
sg_ansible_descrption = "Abdelatif EC2 02 Security Group"

# Vault:

sg_vault_name       = "Abdelatif-EC2-03-SG"
sg_vault_descrption = "Abdelatif EC2 03 Security Group"

# BM SG Values:

bm_sg_name       = "Abdelatif-BM-EC2-04-SG"
bm_sg_descrption = "Abdelatif BM EC2 04 Security Group"

# Network Defaults Values:

cidr_block_PublicSubnet01 = "10.0.1.0/24"
az-a                      = "eu-west-1a"
