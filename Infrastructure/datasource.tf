data "aws_security_group" "bastion_sg" {
  id = var.bastion_security_group_id
}

data "aws_instance" "ec2_bastion" {
  filter {
    name = "tag:Name"
    values = ["Abdelatif-EC2-00"]
  }

  filter {
    name = "instance-state-name"
    values = ["running"]
  }
}
data "aws_instance" "ec2_ansible" {
  instance_id = aws_instance.ec2_ansible.id 
}

data "aws_instance" "ec2_jenkins" {
  instance_id = aws_instance.ec2_jenkins.id
}




data "template_file" "install_ansible" {
  template = file("./install_ansible.tftpl")

  vars = {
    ec2_jenkins_private_ip = aws_instance.ec2_jenkins.private_ip
    ec2_vault_private_ip = aws_instance.ec2_vault.private_ip 
    ec2_building_machine_private_ip = aws_instance.ec2-bm.private_ip
  }
}
