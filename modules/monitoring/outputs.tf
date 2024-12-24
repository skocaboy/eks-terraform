output "prometheus_workspace_id" {
  value       = aws_prometheus_workspace.main.id
  description = "The ID of the Prometheus workspace"
}

output "grafana_iam_role_arn" {
  value       = aws_iam_role.grafana.arn
  description = "The ARN of the IAM role used by Grafana for accessing Prometheus"
}
