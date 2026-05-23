terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "6.43.0"
        }
    }
}
provider "aws" {
    # Config options
    region = "us-east-1"
}

module "s3_bucket" {
  source = "./modules/s3"
}