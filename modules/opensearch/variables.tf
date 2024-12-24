variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "elasticsearch_version" {
  description = "Version of Elasticsearch to deploy"
  default     = "7.10"  # Update to the version you need
  type        = string
}

variable "instance_type" {
  description = "Elasticsearch instance type"
  type        = string
}

variable "instance_count" {
  description = "Number of instances in the Elasticsearch domain"
  type        = number
}

variable "dedicated_master_enabled" {
  description = "Indicates whether dedicated master nodes are enabled"
  type        = bool
}

variable "dedicated_master_type" {
  description = "Instance type of the dedicated master nodes"
  type        = string
}

variable "dedicated_master_count" {
  description = "Number of dedicated master nodes"
  type        = number
}

variable "ebs_enabled" {
  description = "Whether EBS volumes are attached to data nodes"
  type        = bool
}

variable "volume_size" {
  description = "The size of EBS volumes attached to data nodes (in GB)"
  type        = number
}

variable "subnet_ids" {
  description = "Subnet IDs for the VPC in which the domain should reside"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security group IDs for the VPC security groups to attach"
  type        = list(string)
}

variable "snapshot_start_hour" {
  description = "Hour at which automated snapshots are taken"
  type        = number
}
