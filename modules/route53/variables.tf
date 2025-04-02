variable "hosted_zone" {
    description = "The name of the hosted zone"
    default = "tm-yahya.com"
    type = string
  
}

variable "record_name" {
    description = "The name of the hosted zone"
    default = "wordpress.tm-yahya.com"
    type = string
  
}

variable "ip_address" {
    description = "The public IP address of the wordpress EC2 Instance"
    type = string
  
}
