# S3 Bucket for Terraform state
variable "s3_bucket_name" {
  description = "The name of the S3 bucket for Terraform state"
  type        = string
}

variable "dynamo_db_table_name" {
  description = "The name of the DynamoDB table for Terraform locks"
  type        = string
}