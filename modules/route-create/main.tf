resource "aws_route_table" "ROUTE_TABLE" {
  vpc_id = var.VPC_ID

  tags = {
    Name = "${var.AWS_ENV}_ROUTE_PRIVATE"
    Env  = var.AWS_ENV
  }
}