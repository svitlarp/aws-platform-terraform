# ECR
resource "aws_ecr_repository" "lesson_5_ecr" {
  name                 = var.ecr_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

# Repository Policy
data "aws_caller_identity" "current" {}

resource "aws_ecr_repository_policy" "lesson_5_ecr_policy" {
  repository = aws_ecr_repository.lesson_5_ecr.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability"
        ]
      }
    ]
  })
}