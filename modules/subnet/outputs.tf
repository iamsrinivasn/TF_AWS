output "out_subnet_id" {
  description = "Export the VPC ID"
  value = [for i in aws_subnet.SUBNET : i.id]
}