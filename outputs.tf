output "main_out_route_id" {
  description = "Export the new ROUTE ID"
  value = module.ROUTE_CREATE_PRIVATE.out_route_id
}

output "main_out_subnet_id" {
  description = "Export the SUBNET ID"
  value = module.SUBNET_CREATE.out_subnet_id    
  }

output "main_out_igw_id" {
  description = "Export the IGW ID"
  value       = module.IGW_CREATE.out_igw_id
}

output "main_out_vpc_route_id" {
  description = "Export the VPC ID"
  value = module.VPC_CREATE.out_vpc_route_id
  }

output "main_out_vpc_id" {
  description = "Export the VPC ID"
  value = module.VPC_CREATE.out_vpc_id  
  }