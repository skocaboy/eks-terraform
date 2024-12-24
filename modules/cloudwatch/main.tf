resource "aws_cloudwatch_metric_alarm" "high_cpu_utilization" {
  alarm_name          = "high-cpu-utilization-${var.rds_identifier}-${var.environment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "300"
  statistic           = "Average"
  threshold           = 85.0
  alarm_description   = "This metric monitors high CPU utilization for the RDS instance."

  dimensions = {
    DBInstanceIdentifier = var.rds_identifier
  }

  actions_enabled = true
  alarm_actions   = var.alarm_actions
}

resource "aws_cloudwatch_metric_alarm" "free_storage_space" {
  alarm_name          = "low-free-storage-space-${var.rds_identifier}-${var.environment}"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  period              = "300"
  statistic           = "Average"
  threshold           = 1000000000  # Threshold in bytes (1GB)
  alarm_description   = "This metric monitors low free storage space for the RDS instance."

  dimensions = {
    DBInstanceIdentifier = var.rds_identifier
  }

  actions_enabled = true
  alarm_actions   = var.alarm_actions
}
