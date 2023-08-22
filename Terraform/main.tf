# my_project/main.tf

terraform {
  required_version = ">= 1.5.4"
}

provider "aws" {
  region = var.region
}

module "ecr" {
  source                 = "./ecr"
  region                 = var.region
  backend_repo_name = var.backend_repo_name
  frontend_repo_name = var.frontend_repo_name
}

module "vpc" {
  source                     = "./vpc"
  region                     = var.region
  vpc_cidr                   = var.vpc_cidr
  public_subnet_cidr         = var.public_subnet_cidr
  availability_zone          = var.availability_zone
  public_subnet_cidr_2       = var.public_subnet_cidr_2
  availability_zone_2        = var.availability_zone_2
}

module "eks" {
  source                   = "./eks"
  region                   = var.region
  eks_cluster_name         = var.eks_cluster_name
  public_subnet_id         = module.vpc.public_subnet_id
  public_subnet_2_id       = module.vpc.public_subnet_2_id
  # Add other variables for eks module if required
}

module "ec2-jenkin" {
  source                   = "./ec2-jenkin"
  region                   = var.region
  ami                      = var.ami
  instance_type            = var.instance_type
  key_name                 = var.key_name
  vpc_id                   = module.vpc.vpc_id
  public_subnet_id         = module.vpc.public_subnet_id
  public_subnet_2_id       = module.vpc.public_subnet_2_id
}
