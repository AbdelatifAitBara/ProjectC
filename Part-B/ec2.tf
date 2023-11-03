# Create EC2-04 Monitoring instance


resource "aws_instance" "ec2_monitoring" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg_monitoring.id]
  subnet_id              = aws_subnet.PublicSubnet01.id
  key_name               = var.ec2_key_name

  tags = {
    Name     = "Abdelatif-EC2-04"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }

  volume_tags = {
    Name     = "Abdelatif-EC2-04"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}