terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# 1. Create the bucket
resource "aws_s3_bucket" "screenshots" {
  bucket = var.s3_bucket_name

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

# 2. Allow public access
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.screenshots.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# 3. Public read bucket policy
resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.screenshots.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.screenshots.arn}/*"
      }
    ]
  })
}

# 4. Upload screenshots + text files
resource "aws_s3_object" "screenshots" {
  for_each = fileset("${path.module}/screenshots", "*")

  bucket = aws_s3_bucket.screenshots.bucket
  key    = each.value
  source = "${path.module}/screenshots/${each.value}"
  etag   = filemd5("${path.module}/screenshots/${each.value}")
}
