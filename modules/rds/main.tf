resource "aws_security_group" "mysql_sg" {
  name        = "mysql-db-sg"
  description = "Allow MySQL access"
  vpc_id      = var.vpc_id 

  ingress {
    description = "MySQL access from WordPress or other app"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [var.wordpress_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mysql-db-sg"
  }
}

resource "aws_db_instance" "msql_wordpress" {
  allocated_storage    = 10
  db_name              = var.db_name
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_user
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = [aws_security_group.mysql_sg.id]

}