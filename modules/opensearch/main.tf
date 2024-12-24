resource "aws_elasticsearch_domain" "opensearch" {
  domain_name           = "opensearch-${var.environment}"
  elasticsearch_version = var.elasticsearch_version

  cluster_config {
    instance_type            = var.instance_type
    instance_count           = var.instance_count
    dedicated_master_enabled = var.dedicated_master_enabled
    dedicated_master_type    = var.dedicated_master_type
    dedicated_master_count   = var.dedicated_master_count
  }

  ebs_options {
    ebs_enabled = var.ebs_enabled
    volume_size = var.volume_size
  }

  vpc_options {
    subnet_ids = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  access_policies = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = "es:*"
        Resource = "${aws_elasticsearch_domain.opensearch.arn}/*"
      },
    ]
  })

  snapshot_options {
    automated_snapshot_start_hour = var.snapshot_start_hour
  }

  tags = {
    Environment = var.environment
  }
}
