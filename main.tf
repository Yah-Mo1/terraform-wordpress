module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  cidr_block         = var.cidr_block

}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
  instance_type = var.instance_type
  
  db_name     = var.db_name
  db_user     = var.db_user
  db_password = var.db_password
  db_host     = module.rds.db_host

  # depends_on = [ module.rds ]

}


module "rds" {
  source = "./modules/rds"
  db_subnet_group_name = module.vpc.subnet_group_id
  wordpress_sg_id = module.ec2.wordpress_sg_id
  vpc_id = module.vpc.vpc_id
  
  db_name     = var.db_name
  db_user     = var.db_user
  db_password = var.db_password
}
module "route53" {
  source = "./modules/route53"
  ip_address = module.ec2.public_ip
  
}