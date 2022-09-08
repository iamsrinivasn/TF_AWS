resource "aws_internet_gateway" "IGW" {
  vpc_id     = var.VPC_ID

  tags = {
    Name = "${var.AWS_ENV}_IGW_${var.VPC_ID}"
    Env  = var.AWS_ENV
  }
}
