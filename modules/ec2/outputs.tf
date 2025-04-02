output "wordpress_ec2_id" {
    value = aws_instance.wordpress.id
  
}

output "wordpress_sg_id" {
    value = aws_security_group.wordpress_sg.id
  
}

output "public_ip" {
    value = aws_instance.wordpress.public_ip
  
}