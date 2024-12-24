output "high_cpu_utilization_alarm_id" {
  value       = aws_cloudwatch_metric_alarm.high_cpu_utilization.id
  description = "The ID of the high CPU utilization alarm for RDS"
}

output "free_storage_space_alarm_id" {
  value       = aws_cloudwatch_metric_alarm.free_storage_space.id
  description = "The ID of the low free storage space alarm for RDS"
}
