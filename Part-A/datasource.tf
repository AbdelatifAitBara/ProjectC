data "aws_instance" "ec2_vault" {
  instance_id = aws_instance.ec2_vault.id
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