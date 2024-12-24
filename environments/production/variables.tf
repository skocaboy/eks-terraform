variable "region" {
  description = "AWS region for production environment"
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment"
  default     = "production"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the staging environment"
  type        = list(string)
}

variable "rds_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "rds_allocated_storage" {
  description = "The allocated storage size for the RDS instance (in gibibytes)"
  type        = number
}

variable "rds_engine_version" {
  description = "The version of the MySQL engine to use"
  type        = string
}

variable "rds_username" {
  description = "Username for the RDS database"
  type        = string
}

variable "rds_password" {
  description = "Password for the RDS database"
  type        = string
}

variable "rds_subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "rds_security_group_ids" {
  description = "List of security group IDs to associate with the RDS instance"
  type        = list(string)
}

variable "rds_multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
}

variable "rds_delete_automation_retention_period" {
  description = "The automated backups retention period in days"
  type        = number
}
