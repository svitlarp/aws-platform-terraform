output "ecr_id" {
  description = "The ID of the ECR"
  value       = aws_ecr_repository.lesson_5_ecr.id
}

output "ecr_url" {
  description = "The URL of the ECR"
  value       = aws_ecr_repository.lesson_5_ecr.repository_url
}