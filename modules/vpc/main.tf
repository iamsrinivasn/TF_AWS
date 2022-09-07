resource "aws_vpc" "VPC" {
  cidr_block       = var.VPC_CIDR
  instance_tenancy = "default"

  tags = {
    Name = var.AWS_ENV,
    Env  = var.AWS_ENV
  }
}