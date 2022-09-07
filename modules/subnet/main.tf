resource "aws_subnet" "SUBNET" {
  count = length(var.SUBNET_CIDR)
  vpc_id     = var.VPC_ID
  cidr_block = var.SUBNET_CIDR[count.index]

  tags = {
    Name = "subnet"
    Env  = var.AWS_ENV
  }
}