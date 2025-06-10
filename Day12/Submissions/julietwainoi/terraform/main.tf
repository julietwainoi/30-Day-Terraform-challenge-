provider "aws" {
  region = "us-east-1"
}

module "networking" {
  source     = "./modules/networking"
  cidr_block = var.vpc_cidr
}

module "application" {
  source     = "./modules/application"
  ami_id     = var.ami_id
  active_env = var.active_env
  vpc_id     = module.networking.vpc_id
}
