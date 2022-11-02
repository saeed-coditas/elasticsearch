terraform {
  backend "s3" {
    bucket  = "terraform-elastic"
    key     = "ec2.tfstate"
    region  = "us-west-2"
    profile = "myacc"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.21"
    }
  }
}

provider "aws" {
  region  = local.region
  profile = "myacc"
}