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

### Terraform AWS - ROUTE IGW  ###
module "ROUTE_IGW" {
  source   = "./modules/route-default"
  AWS_ENV  = var.AWS_ENV
  IGW_ID = module.IGW_CREATE.out_igw_id
  ROUTE_ID = module.VPC_CREATE.out_vpc_route_id
}
/*
### Terraform AWS - ROUTE DEFAULT PUBLIC  ###
module "ROUTE_ASSOCIATION_PUBLIC" {
  source   = "./modules/route-association"
  SUBNET_ID = module.SUBNET_CREATE.out_subnet_id[0]
  ROUTE_ID = module.VPC_CREATE.out_vpc_route_id
}
*/
### Terraform AWS - ROUTE CREATE PRIVATE  ###
module "ROUTE_CREATE_PRIVATE" {
  source   = "./modules/route-create"
  VPC_ID = module.VPC_CREATE.out_vpc_id
  AWS_ENV  = var.AWS_ENV
}

### Terraform AWS - ROUTE ASSOCIATE PRIVATE  ###
module "ROUTE_ASSOCIATION_PRIVATE" {
  source  = "./modules/route-association"
  SUBNET_CIDR = var.SUBNET_CIDR
  ROUTE_ID = module.ROUTE_CREATE_PRIVATE.out_route_id
}