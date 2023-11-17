# Create a sg for Jenkins instance

resource "aws_security_group" "sg_jenkins" {
  name        = var.sg_jenkins_name
  description = var.sg_jenkins_descrption
  vpc_id      = var.vpc_id

  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = data.aws_instances.tagged.instances[0].private_ip
  }

  ingress {
    description = "allow http"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "Abdelatif-EC2-01-SG"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}

# Create a sg for Ansible instance

resource "aws_security_group" "sg_ansible" {
  name        = var.sg_ansible_name
  description = var.sg_ansible_descrption
  vpc_id      = var.vpc_id

  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = data.aws_instances.tagged.instances[0].private_ip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "Abdelatif-EC2-02-SG"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}

# Create Sg For Vault

resource "aws_security_group" "sg_vault" {
  name        = var.sg_vault_name
  description = var.sg_vault_descrption
  vpc_id      = var.vpc_id

  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = data.aws_instances.tagged.instances[0].private_ip
  }

  ingress {
    description = "Vault RPC port"
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "Abdelatif-EC2-03-SG"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }

}



# Create a sg for Building Machine:

resource "aws_security_group" "bm-sg" {

  name        = var.bm_sg_name
  description = var.bm_sg_descrption
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = data.aws_instances.tagged.instances[0].private_ip
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "Abdelatif-BM-SG"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }

}