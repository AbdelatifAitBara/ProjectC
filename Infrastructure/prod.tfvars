# Network Defaults Values:

az-a = "eu-west-1a"
az-b = "eu-west-1b"

vpc_id    = "vpc-0f0186dfaa776d811"
igw_id    = "igw-05d827b8859292043"
ngw-vpc-b = "nat-0da3f612c02cd4175"



cidr_block_PublicSubnet01  = "10.0.110.0/24"
cidr_block_PublicSubnet02  = "10.0.111.0/24"
cidr_block_PrivateSubnet01 = "10.0.112.0/24"
cidr_block_PrivateSubnet02 = "10.0.113.0/24"


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


# Basation SG_ID: 

bastion_security_group_id = "sg-01ab84734c68629ae"

# EC2 Defaults Values:

ami            = "ami-0694d931cee176e7d"
instance_type  = "t2.micro"
jenkins_type   = "t3.small"
volume_type    = "gp3"
volume_size    = 8
ec2_key_name   = "Abdelatif-KeyPair"
terraform_role = "terraform-iam-role"


# EKS Defaults Values:

eks-iam-role     = "arn:aws:iam::019050461780:role/eks-iam-role"
node-iam-role    = "arn:aws:iam::019050461780:role/eksworkernodes-iam-role"
eks_cluster_name = "Abdelatif-K8sCluster"