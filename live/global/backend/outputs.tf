output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraform_state.arn
  description = "The ARNof the S3 bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
  description = "The name of the DynamoDB table"
}

output "s3_bucket_test_arn" {
  value       = aws_s3_bucket.terraform_state_test.arn
  description = "The ARNof the S3 bucket for testing"
}

output "dynamodb_table_test_name" {
  value       = aws_dynamodb_table.terraform_locks_test.name
  description = "The name of the DynamoDB table for testing"
}

