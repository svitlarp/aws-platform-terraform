variable "ecr_name" {
  type        = string
  description = "Name for the Elascic Container Regestry"
}

variable "image_tag_mutability" {
  type        = bool
  description = "ECR image tag mutability"
}