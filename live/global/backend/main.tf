provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-rdnudxq0"

  # Prevent accidential deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locks-rdnudxq0"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "terraform_state_test" {
  bucket = "terraform-state-for-testing"

  # Prevent accidential deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks_test" {
  name         = "terraform-state-locks-for-testing"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
