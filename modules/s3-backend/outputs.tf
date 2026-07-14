output "s3_bucket_domain_name_tfstate" {
  description = "The Domain Name of S3 bucket for Terraform State"
  value       = aws_s3_bucket.tfstate.bucket_regional_domain_name
}

output "dynamodb_table_name_tfstate" {
  description = "The Name of DynamoDB table for Terraform State"
  value       = aws_dynamodb_table.terraform_locks.id
}