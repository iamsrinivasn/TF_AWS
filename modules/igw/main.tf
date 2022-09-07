resource "aws_internet_gateway" "IGW" {
  vpc_id     = var.VPC_ID

  tags = {
    Name = "IGW"
    Env  = var.AWS_ENV
  }
}