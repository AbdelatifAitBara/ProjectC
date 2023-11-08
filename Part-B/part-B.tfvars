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

# BM Asg:

sg-bm-name        = "Abdelatif-BM-ASG-SG"
sg-bm-description = "Abdelatif BM-Asg Security Group"


# Monitoring

sg_monitoring_name        = "Abdelatif-EC2-04-SG"
sg_monitoring_description = "Abdelatif EC2 04 Security Group"

# Network Defaults Values:

cidr_block_PublicSubnet01  = "10.0.110.0/24"
cidr_block_PublicSubnet02  = "10.0.111.0/24"
cidr_block_PrivateSubnet01 = "10.0.112.0/24"
cidr_block_PrivateSubnet02 = "10.0.113.0/24"
az-a                       = "eu-west-1a"
az-b                       = "eu-west-1b"
ngw-vpc-b                  = "nat-04ab1b64a16ee375a"


# EKS Defaults Values:

eks-iam-role     = "arn:aws:iam::019050461780:role/eks-iam-role"
node-iam-role    = "arn:aws:iam::019050461780:role/eksworkernodes-iam-role"
eks_cluster_name = "Abdelatif-K8sCluster"