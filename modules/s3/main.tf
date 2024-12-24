resource "aws_s3_bucket" "s3_bucket" {
  bucket = "s3-bucket-${var.environment}-${random_id.bucket_suffix.hex}"
  acl    = "private"

  versioning {
    enabled = true
  }

  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "MyS3Bucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "s3-log-bucket-${var.environment}-${random_id.bucket_suffix.hex}"
  acl    = "log-delivery-write"
}

resource "random_id" "bucket_suffix" {
  byte_length = 8
}
