terraform {
  backend "s3" {
    bucket         = "terraform-state-myproject-5678"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
  }
}
