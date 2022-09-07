variable "AWS_ENV" {
 type = string
 description = "AWS ENVIREMENT"
}

variable "VPC_ID" {
 type = string
 description = "VPC ID"
}

variable "SUBNET_CIDR" {
  # type        = list(string)
  type = map 
  description = "SUBNET CIDR /24"
}

