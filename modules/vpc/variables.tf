variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "private_subnets" {
  description = "List of CIDR blocks for the private subnets in each availability zone"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones to deploy private subnets"
  type        = list(string)
}

variable "environment" {
  description = "Deployment environment, e.g., staging, production"
  type        = string
}
