# vpc variables

variable "vpc_cidr" {
  description = "The vpc subnet cidr block"


}

variable "public_subnet_cidr" {
  description = "The public subnet cidr block"

}

variable "cidr_block" {

  description = "The route cidr block for route tables"

}


variable "instance_type" {
  description = "The instance type of the EC2 Wordpress Instance"

}
