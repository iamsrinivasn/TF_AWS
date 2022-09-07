variable "AWS_ENV" {
  type        = string
  description = "AWS ENVIREMENT"
}

variable "AWS_REGION" {
  type        = string
  description = "AWS REGION"
}

variable "VPC_CIDR" {
  type        = string
  description = "VPC CIDR /16"
}

variable "SUBNET_CIDR" {
  type        = list(string)
  description = "SUBNET CIDR /24"
}
