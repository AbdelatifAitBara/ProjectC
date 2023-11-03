#data "aws_instance" "ec2_vault" {
#  instance_id = aws_instance.ec2_vault.id
#}

#data "template_file" "install_ansible_user_data" {
#  template = file("./install_ansible.tftpl")
#  vars = {
#    ec2_vault_ip = aws_instance.ec2_vault.public_ip
#  }
#}