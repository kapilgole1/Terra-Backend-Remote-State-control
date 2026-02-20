# Create an S3 bucket with versioning enabled

resource "aws_s3_bucket" "Task-1-bucket" {
  bucket = "task-1-bucket-terraform-21-feb-2026"
  
  tags = {
    Name        = "My-bucket"
  }
}

# Enable versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "Task-1-bucket-versioning" {
  bucket = aws_s3_bucket.Task-1-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption for the S3 bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "server_configuration" {
  bucket = aws_s3_bucket.Task-1-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block public access to the S3 bucket
resource "aws_s3_bucket_public_access_block" "block-public" {
  bucket = aws_s3_bucket.Task-1-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}