# Create EC2-01 Jenkins Master instance

resource "aws_instance" "ec2_jenkins" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg_jenkins.id]
  subnet_id              = aws_subnet.PrivateSubnet01.id
  key_name               = aws_key_pair.Abdelatif-KeyPair-AWS.key_name
  iam_instance_profile   = var.terraform_role
  user_data              = data.template_file.install_jenkins.rendered

  tags = {
    Name     = "Abdelatif-EC2-01"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }

  volume_tags = {
    Name     = "Abdelatif-EC2-01"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}


# Create EC2-02 Jenkins Agent instance ( Ansible )

resource "aws_instance" "ec2_ansible" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg_ansible.id]
  subnet_id              = aws_subnet.PrivateSubnet01.id
  key_name               = aws_key_pair.Abdelatif-KeyPair-AWS.key_name
  iam_instance_profile   = var.terraform_role
  user_data              = data.template_file.install_ansible.rendered

  tags = {
    Name     = "Abdelatif-EC2-02"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }

  volume_tags = {
    Name     = "Abdelatif-EC2-02"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}


# Create EC2-03 Vault instance

resource "aws_instance" "ec2_vault" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg_vault.id]
  subnet_id              = aws_subnet.PrivateSubnet01.id
  key_name               = aws_key_pair.Abdelatif-KeyPair-AWS.key_name
  user_data              = data.template_file.install_vault.rendered


  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = true
  }

  tags = {
    Name     = "Abdelatif-EC2-03"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }

  volume_tags = {
    Name     = "Abdelatif-EC2-03"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}

# Deploy EC2-04 Building Machine :


resource "aws_instance" "ec2-bm" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.ec2_key_name
  vpc_security_group_ids = [aws_security_group.bm-sg.id]
  subnet_id              = aws_subnet.PrivateSubnet01.id
  user_data              = data.template_file.bm_user_data.rendered

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = true
  }


  tags = {
    Name     = "Abdelatif-EC2-04-BM"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }

  volume_tags = {
    Name     = "Abdelatif-EC2-04-BM"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}