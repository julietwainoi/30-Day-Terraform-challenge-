provider "aws" {
  region = "us-west-2"
}

module "network" {
  source = "../../modules/network"
}

module "alb" {
  source     = "../../modules/alb"
  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.subnet_ids
  alb_sg_id  = module.network.alb_sg_id
}

module "asg" {
  source            = "../../modules/asg"
  ami_id            = var.ami_id
  app_sg_id         = module.network.app_sg_id
  subnet_ids        = module.network.subnet_ids
  target_group_arn  = module.alb.target_group_arn
}

output "load_balancer_url" {
  value = module.alb.alb_dns_name
}
