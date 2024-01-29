# Setup our aws provider
provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "news4321-terraform-infra"
    region = "eu-west-1"
    dynamodb_table = "news4321-terraform-locks"
    key = "backend/terraform.tfstate"
  }
}
