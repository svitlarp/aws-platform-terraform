# S3 Bucket for terraform state file
resource "aws_s3_bucket" "tfstate" {
  bucket = var.s3_bucket_name

  tags = {
    Name = var.s3_bucket_name
    Project     = var.project
    Environment = var.environment
    Purpose = "terraform-state"
  }
}

resource "aws_s3_bucket_versioning" "tfstate_versionning" {
  bucket = aws_s3_bucket.tfstate.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "tfstate_ownership" {
  bucket = aws_s3_bucket.tfstate.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}