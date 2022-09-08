/*
resource "aws_route_table_association" "ROUTE_ASSOCIATION" {
  for_each = tomap(var.SUBNET_CIDR)
  cidr_block = each.value

  subnet_id      = var.SUBNET_ID
  route_table_id = var.ROUTE_ID
}
*/

resource "aws_route_table_association" "ROUTE_ASSOCIATION" {
  for_each = tomap(var.SUBNET_CIDR)
  cidr_block = each.key

  subnet_id      = var.SUBNET_ID
  route_table_id = var.ROUTE_ID
}



