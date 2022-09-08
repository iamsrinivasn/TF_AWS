resource "aws_default_route_table" "ROUTE_IGW" {
  default_route_table_id = var.ROUTE_ID

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.IGW_ID
  }


  tags = {
    Name = "${var.AWS_ENV}_ROUTE_IGW"
    Env  = var.AWS_ENV
  }
}