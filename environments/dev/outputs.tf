output "vpc" {
  description = "The ID of the VPC main"
  value       = module.vpc.vpc_id
}

output "s3_bucket_domain_name" {
  description = "The Domain Name of S3 bucket for Terraform State"
  value       = module.s3-backend.s3_bucket_domain_name_tfstate
}

output "dynamodb_table_name" {
  description = "The Name of DynamoDB table for Terraform State"
  value       = module.s3-backend.dynamodb_table_name_tfstate
}

output "ecr_repository_url" {
  description = "The URL of ECR repository"
  value       = module.ecr.ecr_url
}
