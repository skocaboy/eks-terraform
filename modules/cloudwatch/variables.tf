variable "rds_identifier" {
  description = "The identifier of the RDS instance"
  type        = string
}

variable "environment" {
  description = "Deployment environment, e.g., staging, production"
  type        = string
}

variable "alarm_actions" {
  description = "A list of ARNs of the actions to take when the alarm state is triggered"
  type        = list(string)
}
