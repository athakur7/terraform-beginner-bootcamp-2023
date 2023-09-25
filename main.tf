terraform {
   cloud {
    organization = "TerraFusion"
    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "random" {
  # Configuration options
}
provider "aws" {
  # Configuration options
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "bucket_name" {
  length  = 6
  special = false
  upper   = false
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "aws_bucket_name" {
  bucket = "anand-s3-terraform-bucket-${random_string.bucket_name.result}"
}

output "random_bucket_name" {
  # value = random_string.bucket_name.result
  value = aws_s3_bucket.aws_bucket_name.id
}
