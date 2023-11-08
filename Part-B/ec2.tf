# Create Building Machine :


resource "aws_instance" "abdelatif-bm" {
    ami                    = var.ami
    instance_type          = var.instance_type
    key_name               = var.ec2_key_name
    vpc_security_group_ids = [aws_security_group.bm-sg.id]
    subnet_id              = aws_subnet.PublicSubnet01.id
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