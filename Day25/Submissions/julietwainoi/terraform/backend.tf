terraform {
  backend "s3" {
    bucket         = "terraform-state-myproject"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
