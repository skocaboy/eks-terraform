variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage size for the RDS instance (in gibibytes)"
  type        = number
}

variable "engine_version" {
  description = "The version of the MySQL engine to use"
  type        = string
}

variable "username" {
  description = "Username for the RDS database"
  type        = string
}

variable "password" {
  description = "Password for the RDS database"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the RDS instance"
  type        = list(string)
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
}

variable "delete_automation_retention_period" {
  description = "The automated backups retention period in days"
  type        = number
}
