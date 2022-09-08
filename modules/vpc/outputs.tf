output "out_vpc_id" {
  description = "Export the VPC ID"
  value       = aws_vpc.VPC.id
}

output "out_vpc_route_id" {
  description = "Export the VPC ID"
  value       = aws_vpc.VPC.default_route_table_id
}