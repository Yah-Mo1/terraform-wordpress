variable "db_subnet_group_name" {
    description = "The Subnets the Database will be created in"
  
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type = string
}

variable "allowed_cidr_blocks" {
    description = "CIDR blocks allowed for the security groups"
    default = ["0.0.0.0/0"]
}


variable "wordpress_sg_id" {
    description = "The ID of the wordpress security group"
  
}
variable "db_name" {
    type = string
  
}

variable "db_user" {
    type = string
  
}

variable "db_password" {

    type = string
  
}
