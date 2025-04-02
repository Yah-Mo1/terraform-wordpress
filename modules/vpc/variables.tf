
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