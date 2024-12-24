variable "subnet_ids" {
  description = "Subnet IDs for the ElastiCache subnet group"
  type        = list(string)
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "node_type" {
  description = "The node type of the Redis instances"
  type        = string
}

variable "num_cache_nodes" {
  description = "The number of nodes for the cache cluster"
  type        = number
}
