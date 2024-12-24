variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_role_arn" {
  description = "The ARN of the IAM role that the EKS cluster will assume"
  type        = string
}

variable "node_group_name" {
  description = "The name of the node group within the EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "The ARN of the IAM role that the node group will assume"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs where the EKS cluster and node groups are deployed"
  type        = list(string)
}

variable "node_desired_size" {
  description = "Desired number of nodes in the node group"
  type        = number
}

variable "node_max_size" {
  description = "Maximum number of nodes in the node group"
  type        = number
}

variable "node_min_size" {
  description = "Minimum number of nodes in the node group"
  type        = number
}

variable "region" {
  description = "AWS region where the EKS cluster will be created"
  type        = string
}
