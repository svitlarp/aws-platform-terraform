output "ecr_id" {
  description = "The ID of the ECR"
  value       = aws_ecr_repository.fleet-app.id
}

output "ecr_url" {
  description = "The URL of the ECR"
  value       = aws_ecr_repository.fleet-app.repository_url
}