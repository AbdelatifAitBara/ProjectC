# Constants
variable "vpc_id" {
  type        = string
  description = "abdelatif vpc id"
}



# EC2 Variables
variable "ami" {
  type        = string
  description = "ami of ubuntu"
}

variable "instance_type" {
  type        = string
  description = "instance type"
}

variable "volume_type" {
  type        = string
  description = "volume type"
}

variable "volume_size" {
  type        = number
  description = "volume size"
}

variable "ec2_key_name" {
  type        = string
  description = "key pair for my ec2 instances"
}

variable "terraform_role" {
  type        = string
  description = "role for terraform"
}




# SG Variabless

# Ansible SG Variables

variable "sg_ansible_name" {
  type        = string
  description = "ansible sg name"
}

variable "sg_ansible_descrption" {
  type        = string
  description = "sg for ansible"
}

# Vault SG Variables

variable "sg_vault_name" {
  type        = string
  description = "vault sg name"
}

variable "sg_vault_descrption" {
  type        = string
  description = "sg for vault"
}

# Network Variables

variable "cidr_block_PublicSubnet01" {
  type        = string
  description = "cidr block for PublicSubnet01"
}

variable "az-a" {
  type        = string
  description = "eu-west-1a az"
}

variable "igw_id" {
  type        = string
  description = "igw id"
}