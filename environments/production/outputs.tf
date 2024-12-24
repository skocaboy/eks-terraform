output "aws_region" {
  value = var.region
  description = "The AWS region the infrastructure is deployed in."
}

output "production_cluster_id" {
  value = module.eks.cluster_id
}

output "production_node_group_id" {
  value = module.eks.node_group_id
}

output "production_karpenter_role_arn" {
  value = module.eks.karpenter_role_arn
}

output "production_vpc_id" {
  value = module.vpc.vpc_id
}

output "production_private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "production_elasticache_redis_cluster_id" {
  value = module.elasticache.elasticache_redis_cluster_id
}

output "production_prometheus_workspace_id" {
  value = module.monitoring.prometheus_workspace_id
}

output "production_grafana_iam_role_arn" {
  value = module.monitoring.grafana_iam_role_arn
}

output "production_high_cpu_utilization_alarm_id" {
  value = module.cloudwatch.high_cpu_utilization_alarm_id
}

output "production_free_storage_space_alarm_id" {
  value = module.cloudwatch.free_storage_space_alarm_id
}

output "staging_opensearch_domain_id" {
  value = module.opensearch.opensearch_domain_id
}

output "staging_opensearch_domain_endpoint" {
  value = module.opensearch.opensearch_domain_endpoint
}

output "staging_rds_instance_id" {
  value = module.rds.rds_instance_id
}

output "staging_rds_instance_endpoint" {
  value = module.rds.rds_instance_endpoint
}

output "staging_s3_bucket_name" {
  value = module.s3.s3_bucket_name
}

output "staging_s3_log_bucket_name" {
  value = module.s3.s3_log_bucket_name
}