output "rds_instance_id" {
  value       = aws_db_instance.mysql.id
  description = "The ID of the RDS MySQL instance"
}

output "rds_instance_endpoint" {
  value       = aws_db_instance.mysql.endpoint
  description = "The connection endpoint for the RDS MySQL instance"
}
