output "bucket_name" {
  value = var.s3_bucket_name
}

output "bucket_arn" {
  value = aws_s3_bucket.screenshots.arn
}
