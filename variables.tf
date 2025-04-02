# vpc variables

variable "vpc_cidr" {
  description = "The vpc subnet cidr block"
  type = string


}

variable "public_subnet_cidr" {
  description = "The public subnet cidr block"
  type = string

}

variable "cidr_block" {

  description = "The route cidr block for route tables"
  type = string

}


variable "instance_type" {
  description = "The instance type of the EC2 Wordpress Instance"
  type = string

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
