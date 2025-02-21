output "wordpress_ec2_id" {
    value = aws_instance.wordpress.id
  
}


output "public_ip" {
    value = aws_instance.wordpress.public_ip
  
}