variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "s3_bucket_name" {
  type        = string
  description = "Name of the S3 bucket to create and upload files to. Must be owned by the user."
}
