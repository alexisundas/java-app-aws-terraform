module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "security_groups" {
  source   = "./modules/security-groups"
  vpc_id   = module.vpc.vpc_id
}


module "web" {
  source = "./modules/ec2"
  ami            = "ami-08188dffd130a1ac2"  # Replace with your preferred Linux AMI
  instance_type  = "t2.medium"
  security_group = module.security_groups.web_sg_id
  DOCKERHUB_TOKEN = var.DOCKERHUB_TOKEN
  DOCKERHUB_USERNAME = var.DOCKERHUB_USERNAME
  subnet_ids = module.vpc.subnet_ids
  subnets = module.vpc.subnet_ids
}


