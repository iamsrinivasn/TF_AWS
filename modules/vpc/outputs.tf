output "out_vpc_id" {
  description = "Export the VPC ID"
  value       = aws_vpc.VPC.id
}