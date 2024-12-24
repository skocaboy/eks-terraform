resource "aws_elasticache_subnet_group" "main" {
  name        = "elasticache-subnet-group-${var.environment}"
  subnet_ids  = var.subnet_ids

  tags = {
    Name        = "ec-subnet-group-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "redis-cluster-${var.environment}"
  engine               = "redis"
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = "default.redis3.2"
  subnet_group_name    = aws_elasticache_subnet_group.main.name

  tags = {
    Name        = "redis-${var.environment}"
    Environment = var.environment
  }
}
