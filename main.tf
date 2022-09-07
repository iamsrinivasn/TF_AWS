terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region                  = var.AWS_REGION
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "tfadmin"
}

module "VPC_CREATE" {
  # Create a new VPC
  source   = "./modules/vpc"
  AWS_ENV  = var.AWS_ENV
  VPC_CIDR = var.VPC_CIDR
}