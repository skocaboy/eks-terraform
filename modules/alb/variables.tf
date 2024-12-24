variable "alb_name" {
  description = "The name of the Application Load Balancer"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to attach to the ALB"
  type        = list(string)
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the ALB"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}
