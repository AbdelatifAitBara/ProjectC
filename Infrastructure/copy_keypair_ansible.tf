#Copy Key Pair from my bastion to my Ansible server

resource "null_resource" "copy_key_pair" {
    depends_on = [ aws_instance.ec2_ansible ]

    provisioner "local-exec" {
    command = "chmod 400 ./Abdelatif-Key.pem && scp -o StrictHostKeyChecking=no -i ./Abdelatif-Key.pem ubuntu@${aws_instance.ec2_ansible.private_ip}:/home/ubuntu/ansible/key.pem ./key.pem"
    }

}