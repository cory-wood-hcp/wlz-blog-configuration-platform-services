output "s3_bucket_arn" {
  description = "ARN of the logging S3 bucket"
  value       = aws_s3_bucket.logging.arn
}