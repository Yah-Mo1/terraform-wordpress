variable "vpc_id" {
  description = "The ID of the VPC"
  type = string
}

variable "instance_type" {
    description = "The instance type of the EC2 Wordpress Instance"
  
}

variable "subnet_id" {
    description = "The subnet for the EC2 Wordpress Instance"
  
}

variable "allowed_cidr_blocks" {
    description = "CIDR blocks allowed for the security groups"
    default = ["0.0.0.0/0"]
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

variable "db_host" {
  type = string
}