data "aws_instance" "ec2_vault" {
  instance_id = aws_instance.ec2_vault.id
}

data "aws_security_group" "bastion_sg" {
  id = var.bastion_security_group_id
}

data "aws_instance" "ec2_bastion" {
  filter {
    name   = "tag:Name"
    values = ["Abdelatif-EC2-00"] #  That's a literal, match the correct EC2 instance on that tag value
  }
}



data "template_file" "install_jenkins" {
  template = file("./install_jenkins.tftpl")
}

data "template_file" "install_ansible" {
  template = file("./install_ansible.tftpl")

  vars = {
    ec2_jenkins_private_ip = aws_instance.ec2_jenkins.private_ip
    ec2_vault_private_ip = aws_instance.ec2_vault.private_ip 
    ec2_building_machine_private_ip = aws_instance.ec2-bm.private_ip
  }
}


data "template_file" "install_vault" {
  template = file("./install_vault.tftpl")
}

data "template_file" "bm_user_data" {
  template = file("./bm_user_data.tftpl")
}