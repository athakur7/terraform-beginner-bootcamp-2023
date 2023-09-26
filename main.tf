
# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "bucket_name" {
  length  = 6
  special = false
  upper   = false
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "aws_bucket_name" {
  bucket = "anand-s3-terraform-bucket-${random_string.bucket_name.result}"
   tags = {
    UserUuid = var.user_uuid
  }
}


