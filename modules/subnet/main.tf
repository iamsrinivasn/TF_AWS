resource "aws_subnet" "SUBNET" {

  vpc_id     = var.VPC_ID
  
  # count = length(var.SUBNET_CIDR)
  # cidr_block = var.SUBNET_CIDR[count.index].address
  for_each = tomap(var.SUBNET_CIDR)
  cidr_block = each.value

  tags = {
    Name = "${var.AWS_ENV}_${each.key}"
    Env  = var.AWS_ENV
  }
}