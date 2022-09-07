resource "aws_vpc" "main" {
  cidr_block       = var.VPC_CIDR
  instance_tenancy = "default"

  tags = {
    Name = "main",
    Env  = var.AWS_ENV
  }
}