resource "aws_subnet" "SUBNET" {
  # count = length(var.SUBNET_CIDR)
  vpc_id     = var.VPC_ID
  # cidr_block = var.SUBNET_CIDR[count.index].address

  for_each = toset(var.SUBNET_CIDR)
  cidr_block = each.key

  tags = {
    Name = "subnet"
    Env  = var.AWS_ENV
  }
}