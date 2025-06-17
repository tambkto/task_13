module "vpc" {
  source = "./vpc"
  vpc_cidr = var.vpc-cidr
  cidr_allowing_all = var.cidr-allowing-all
  public_subnet_cidr = var.public-subnet-cidr
  owner_name = "Umar"
  providers = {
    aws = aws.ohio
  }
}
module "ecs" {
  source = "./ecs"
  owner_name = var.ownername
  aws_subnet = module.vpc.aws_subnet
  vpcid = module.vpc.vpc_id
  cidr_allowing_all = var.cidr-allowing-all
  
  providers = {
    aws = aws.ohio
  }
}