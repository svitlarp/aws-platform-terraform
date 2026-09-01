output "vpc" {
  description = "The ID of the VPC main"
  value       = module.vpc.vpc_id
}

output "s3_bucket_domain_name" {
  description = "The Domain Name of S3 bucket for Terraform State"
  value       = module.s3.s3_bucket_domain_name_tfstate
}

output "dynamodb_table_name" {
  description = "The Name of DynamoDB table for Terraform State"
  value       = module.s3.dynamodb_table_name_tfstate
}

output "ecr_repository_url" {
  description = "The URL of ECR repository"
  value       = module.ecr.ecr_url
}

# EKS Cluster
output "eks_cluster_name" {
  description = "The Name of EKS cluster"
  value       = module.eks.eks_cluster_name
}

output "eks_cluster_iam_role_name" {
  description = "The Name of EKS Cluster IAM Role"
  value       = module.eks.eks_cluster_iam_role_name
}

# EKS Node Group
output "eks_node_group_name" {
  description = "The Name of EKS Node Group"
  value       = module.eks.eks_node_group_name
}

output "eks_node_group_iam_role_name" {
  description = "The Name of EKS Cluster IAM Role"
  value       = module.eks.eks_node_group_iam_role_name
}