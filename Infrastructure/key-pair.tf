# Create Key Pair For My EC2 Instances

resource "tls_private_key" "Abdelatif-KeyPair" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "Abdealtif-KeyPair-Local" {
  content  = tls_private_key.Abdelatif-KeyPair.private_key_pem
  filename = "Abdelatif-Key.pem"
}


resource "aws_key_pair" "Abdelatif-KeyPair-AWS" {
  key_name   = "Abdelatif-KeyPair"
  public_key = tls_private_key.Abdelatif-KeyPair.public_key_openssh
}

# Upload Key Pair to S3

resource "aws_s3_object" "key_pair" {
  bucket = "abdelatif-s3"
  key    = "Abdelatif-Key.pem"
  source = local_file.Abdealtif-KeyPair-Local.filename
}

resource "aws_s3_bucket_policy" "abdelatif-s3-policy" {
  bucket = "abdelatif-s3"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowS3AccessFromPrivateInstance",
            "Effect": "Allow",
            "Principal": {
              "AWS": "${aws_instance.ec2_ansible.arn}"  
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::abdelatif-s3/Abdelatif-Key.pem",
            
            }
        }
    ]
}

EOF
}
