# vpc

resource "aws_vpc" "vpc" {

  cidr_block = var.vpc_cidr

}

# Public subnet

resource "aws_subnet" "public_subnet" {


  vpc_id = aws_vpc.vpc.id

  cidr_block = var.public_subnet_cidr

  availability_zone = "eu-west-2a"

  map_public_ip_on_launch = true

}

# Define internet gateway 

resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.vpc.id

}

# Define route table for public subnet 

resource "aws_route_table" "public_route_table" {

  vpc_id = aws_vpc.vpc.id



  route {

    cidr_block = var.cidr_block

    gateway_id = aws_internet_gateway.igw.id

  }

  tags = {

    Name = "Public"

  }

}

# Associate public subnet with public route table 

resource "aws_route_table_association" "public_route_assoc" {

  subnet_id = aws_subnet.public_subnet.id

  route_table_id = aws_route_table.public_route_table.id

}

