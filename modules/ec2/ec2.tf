# Wordpress nsg 
resource "aws_security_group" "wordpress_sg" {
  name        = "wordpress_sg"
  description = "Allow web and SSH traffic"
  vpc_id      = var.vpc_id

//Check to see if SSH is allowed
 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }


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

resource "aws_instance" "wordpress" {
  ami                    = "ami-04da26f654d3383cf"
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id 
  vpc_security_group_ids = [aws_security_group.wordpress_sg.id]


connection { 

    type        = "ssh" 

    user        = "ubuntu" 

    private_key = file("~/.sshkey/wordpress-key.pem") # Update with your private key file path 

    host        = self.public_ip 

  } 

  key_name               = data.aws_key_pair.key.key_name

  user_data = templatefile("${path.module}/userdata.sh.tpl", {
    db_name     = var.db_name
    db_user     = var.db_user
    db_password = var.db_password
    db_host     = var.db_host
  })

  tags = {
    Name = "WordPress-Instance"
  }
}