output "opensearch_domain_id" {
  value       = aws_elasticsearch_domain.opensearch.domain_id
  description = "The ID of the OpenSearch domain"
}

output "opensearch_domain_endpoint" {
  value       = aws_elasticsearch_domain.opensearch.endpoint
  description = "Endpoint of the OpenSearch domain"
}
