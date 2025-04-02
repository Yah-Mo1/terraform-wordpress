output "vpc_id" {
    value = aws_vpc.vpc.id
  
}


output "subnet_id" {
    value = aws_subnet.public_subnet.id
  
}

output "subnet_group_id" {
    value = aws_db_subnet_group.rds-subnet-group.id
  
}