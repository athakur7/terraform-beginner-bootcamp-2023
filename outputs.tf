output "s3-bucket-created" {
  # value = random_string.bucket_name.result
  value = aws_s3_bucket.aws_bucket_name.id
}