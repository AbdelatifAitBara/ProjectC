# Create EC2-01 Jenkins Master instance

resource "aws_instance" "ec2_jenkins" {
  ami                    = var.ami
  instance_type          = var.jenkins_type
  vpc_security_group_ids = [aws_security_group.sg_jenkins.id]
  subnet_id              = aws_subnet.PublicSubnet01.id
  key_name               = aws_key_pair.Abdelatif-KeyPair-AWS.key_name

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

  depends_on = [ aws_instance.ec2_jenkins, aws_instance.ec2_vault, aws_instance.ec2-bm ]

  provisioner "local-exec" {
      command = "chmod 400 /home/ubuntu/ProjectC/Infrastructure/Abdelatif-Key.pem && sleep 160s && scp -o StrictHostKeyChecking=no -i /home/ubuntu/ProjectC/Infrastructure/Abdelatif-Key.pem /home/ubuntu/ProjectC/Infrastructure/Abdelatif-Key.pem ubuntu@${aws_instance.ec2_ansible.private_ip}:/home/ubuntu/ansible/key.pem"
  }

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'",
    "sleep 200s",#I puted this sleep to wait the status check 2/2 on aws before provisioning my ec2 instances
    "sudo chmod 400 /home/ubuntu/ansible/key.pem",
    "cd /home/ubuntu/ansible && sudo ansible-playbook install_jenkins.yml install_vault.yml install_bm.yml -i inventory.ini --ssh-common-args='-o StrictHostKeyChecking=no'"
    ]


    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = local_file.Abdealtif-KeyPair-Local.content
      host        = self.private_ip
    }
    
  }


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

  provisioner "local-exec" {
      command = "chmod 400 /home/ubuntu/ProjectC/Infrastructure/Abdelatif-Key.pem && sleep 160s && scp -o StrictHostKeyChecking=no -i /home/ubuntu/ProjectC/Infrastructure/Abdelatif-Key.pem /home/ubuntu/ProjectC/Infrastructure/Abdelatif-Key.pem ubuntu@${aws_instance.ec2_vault.private_ip}:/home/ubuntu/key.pem"
  }



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
  instance_type          = var.jenkins_type
  key_name               = var.ec2_key_name
  vpc_security_group_ids = [aws_security_group.bm-sg.id]
  subnet_id              = aws_subnet.PrivateSubnet01.id
  iam_instance_profile   = var.terraform_role

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