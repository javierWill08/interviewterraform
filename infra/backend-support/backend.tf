# This file creates S3 bucket to hold terraform states
resource "aws_s3_bucket" "terraform_infra" {
  bucket = "news4321-terraform-infra"
  force_destroy = true
  
  # To allow rolling back states
  versioning {
    enabled = true
  }

  # To cleanup old states eventually
  lifecycle_rule {
    enabled = true

    noncurrent_version_expiration {
      days = 30
    }
  }

  tags = {
     Name = "Bucket for terraform states of news4321"
     createdBy = "infra-news4321/backend-support"
  }
}

resource "aws_s3_bucket_ownership_controls" "terraform_infra" {
  bucket = aws_s3_bucket.terraform_infra.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "terraform_infra" {
  depends_on = [aws_s3_bucket_ownership_controls.terraform_infra]

  bucket = aws_s3_bucket.terraform_infra.id
  acl    = "private"
}


