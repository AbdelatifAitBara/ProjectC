#data "aws_instance" "ec2_vault" {
#  instance_id = aws_instance.ec2_vault.id
#}

data "template_file" "bm_user_data" {
  template = file("./bm_user_data.tftpl")
  vars = {
    ec2_vault_ip = aws_instance.ec2_vault.public_ip
  }
}