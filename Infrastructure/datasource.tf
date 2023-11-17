data "aws_instance" "ec2_vault" {
  instance_id = aws_instance.ec2_vault.id
}

data "aws_instance" "ec2_bastion" {
  filter {
    name   = "tag:Name"
    values = ["Abdelatif-EC2-00"]
  }

}

data "template_file" "install_jenkins" {
  template = file("./install_jenkins.tftpl")
}

data "template_file" "install_ansible" {
  template = file("./install_ansible.tftpl")
}

data "template_file" "install_vault" {
  template = file("./install_vault.tftpl")
}

data "template_file" "bm_user_data" {
  template = file("./bm_user_data.tftpl")
}