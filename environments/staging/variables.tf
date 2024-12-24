variable "region" {
  description = "AWS region for staging environment"
  default     = "us-west-2"
}

variable "environment" {
  description = "Deployment environment"
  default     = "staging"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the staging environment"
  type        = list(string)
}
