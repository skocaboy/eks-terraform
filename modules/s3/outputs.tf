output "s3_bucket_name" {
  value       = aws_s3_bucket.s3_bucket.bucket
  description = "The name of the S3 bucket"
}

output "s3_log_bucket_name" {
  value       = aws_s3_bucket.log_bucket.bucket
  description = "The name of the S3 log bucket"
}
