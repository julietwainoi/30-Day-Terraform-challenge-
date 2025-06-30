terraform {
  backend "remote" {
    organization = "test1-organisation"

    workspaces {
      name = "30-Day-Terraform-challenge-"
    }
  }
}

module "vpc" {
 source = "app.terraform.io/test1-organisation/vpc/aws"

  version = "1.0.2"

  # Optionally override default inputs if needed
  vpc_name        = "production-vpc"
  vpc_cidr        = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
}

