resource "aws_prometheus_workspace" "main" {
  alias = "Prometheus-${var.environment}"
}

# Assuming the use of Grafana via Amazon Managed Grafana or self-setup
resource "aws_iam_role" "grafana" {
  name = "GrafanaAccessRole-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "grafana.amazonaws.com"
        },
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "grafana" {
  role       = aws_iam_role.grafana.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonPrometheusReadOnlyAccess"
}
