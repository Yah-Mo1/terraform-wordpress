# Wordpress nsg 
resource "aws_security_group" "wordpress_sg" {
  name        = "wordpress_sg"
  description = "Allow web and SSH traffic"
  vpc_id      = var.vpc_id

#  ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = var.allowed_cidr_blocks
#   }


    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.allowed_cidr_blocks
  }


}
data "aws_key_pair" "key" {
  key_name           = "wordpress-key"
  # include_public_key = true

}


data "aws_ami" "wordpress" {
  filter {
    name   = "name"
    values = ["bitnami-wordpresspro-6.5.3-5-r05-linux-debian-12-x86_64-hvm-ebs-nami"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "wordpress" {
  ami                    = "${data.aws_ami.wordpress.id}"
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id 
  vpc_security_group_ids = [aws_security_group.wordpress_sg.id]
  key_name               = data.aws_key_pair.key.key_name

}
