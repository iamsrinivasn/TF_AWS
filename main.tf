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
    region  = var.AWS_REGION
    shared_credentials_file = "~/.aws/credentials"
    profile = "tfadmin"
}


resource "aws_vpc" "main" {
  cidr_block       = var.VPC_CIDR
  instance_tenancy = "default"

  tags = {
    Name = "main",
    Env  = "dev"
  }
}