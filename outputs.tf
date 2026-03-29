output "uploaded_screenshots" {
  value = {
    for k, v in aws_s3_object.screenshots :
    k => v.key
  }
}
