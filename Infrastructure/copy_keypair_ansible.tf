#Copy Key Pair from my bastion to my Ansible server

resource "null_resource" "copy_key_pair" {
    depends_on = [ aws_instance.ec2_ansible ]

    provisioner "file" {
        source      = "Abdelatif-Key.pem"
        destination = "/home/ubuntu/ansible/key.pem"

        connection {
            type        = "ssh"
            user        = "ubuntu"
            private_key = local_file.Abdealtif-KeyPair-Local.content
            host        = data.aws_instance.ec2_ansible.private_ip
        }
    }
}