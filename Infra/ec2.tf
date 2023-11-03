# Create EC2-03 Vault instance

resource "aws_instance" "ec2_vault" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg_vault.id]
  subnet_id              = aws_subnet.PublicSubnet01.id
  key_name               = var.ec2_key_name


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