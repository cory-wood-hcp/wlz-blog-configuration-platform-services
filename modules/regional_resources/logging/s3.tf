# S3 bucket for logging with account ID in the name
resource "aws_s3_bucket" "logging" {
  bucket = "logging-${var.aws_account_id}-${var.region}"
  region = var.region
  tags = merge(var.common_tags, {
    Name    = "logging-${var.aws_account_id}"
    Purpose = "logging"
  })
}

# Block all public access to the S3 bucket
resource "aws_s3_bucket_public_access_block" "logging" {
  bucket = aws_s3_bucket.logging.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  region                  = var.region
}

# Enable server-side encryption for the S3 bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "logging" {
  bucket = aws_s3_bucket.logging.id
  region = var.region
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}