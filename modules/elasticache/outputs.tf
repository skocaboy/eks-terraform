output "elasticache_redis_cluster_id" {
  value       = aws_elasticache_cluster.redis.cluster_id
  description = "The ID of the Redis cluster"
}
