### Terraform Provider Declaration ### 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}
### Terraform Provider AWS ###
provider "aws" {
  region                  = var.AWS_REGION
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "tfadmin"
}
### Terraform AWS - VPC CREATE ###
module "VPC_CREATE" {
  source   = "./modules/vpc"
  AWS_ENV  = var.AWS_ENV
  VPC_CIDR = var.VPC_CIDR
}

### Terraform AWS - IGW CREATE ###
module "IGW_CREATE" {
  source   = "./modules/igw"
  AWS_ENV  = var.AWS_ENV
  VPC_ID = module.VPC_CREATE.out_vpc_id
}

### Terraform AWS - SUBNET's CREATE ###
# List subnets with for_each statement # count.index #
module "SUBNET_CREATE" {
  # Create a new VPC
  source   = "./modules/subnet"
  AWS_ENV  = var.AWS_ENV
  VPC_ID = module.VPC_CREATE.out_vpc_id
  SUBNET_CIDR = var.SUBNET_CIDR
}

