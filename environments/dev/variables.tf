variable "aws_region" {
  type        = string
  description = "The name of AWS region"
}

variable "project" {
  type        = string
  description = "The name of AWS region"
}

variable "environment" {
  type        = string
  description = "The name of AWS region"
}

# vpc
variable "vpc_name" {
  type        = string
  description = "Name Tag for VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC"
}

# subnet_alb_a
variable "subnet_alb_a_name" {
  type        = string
  description = "Name Tag for public subnet subnet_alb_a"
}

variable "subnet_alb_a_cidr" {
  type        = string
  description = "CIDR block for public subnet subnet_alb_a"
}

variable "subnet_alb_a_az" {
  type        = string
  description = "Avialability zones for public subnet_alb_a"
}

# subnet_alb_b
variable "subnet_alb_b_name" {
  type        = string
  description = "Name Tag for public subnet subnet_alb_b"
}

variable "subnet_alb_b_cidr" {
  type        = string
  description = "CIDR block for public subnet subnet_alb_b"
}

variable "subnet_alb_b_az" {
  type        = string
  description = "Avialability zones for public subnet_alb_b"
}

# subnet_alb_c
variable "subnet_alb_c_name" {
  type        = string
  description = "Name Tag for public subnet subnet_alb_c"
}

variable "subnet_alb_c_cidr" {
  type        = string
  description = "CIDR block for public subnet subnet_alb_c"
}

variable "subnet_alb_c_az" {
  type        = string
  description = "Avialability zones for public subnet_alb_c"
}


# subnet_eks_a
variable "subnet_eks_a_name" {
  type        = string
  description = "Name Tag for private subnet subnet_eks_a"
}

variable "subnet_eks_a_cidr" {
  type        = string
  description = "CIDR block for private subnet subnet_eks_a"
}

variable "subnet_eks_a_az" {
  type        = string
  description = "Avialability zones for private subnet_eks_a"
}

# subnet_eks_b
variable "subnet_eks_b_name" {
  type        = string
  description = "Name Tag for private subnet subnet_eks_b"
}

variable "subnet_eks_b_cidr" {
  type        = string
  description = "CIDR block for private subnet subnet_eks_b"
}

variable "subnet_eks_b_az" {
  type        = string
  description = "Avialability zones for private subnet_eks_b"
}

# subnet_eks_c
variable "subnet_eks_c_name" {
  type        = string
  description = "Name Tag for private subnet subnet_eks_c"
}

variable "subnet_eks_c_cidr" {
  type        = string
  description = "CIDR block for private subnet subnet_eks_c"
}

variable "subnet_eks_c_az" {
  type        = string
  description = "Avialability zones for private subnet_eks_c"
}

# internet gateway
variable "igw_alb_name" {
  type        = string
  description = "Internet Gateway for ALB"
}

# NAT gateway
variable "nat_eks_a_name" {
  type        = string
  description = "NAT for ALB 1a"
}

variable "nat_eks_b_name" {
  type        = string
  description = "NAT for ALB 1b"
}

variable "nat_eks_c_name" {
  type        = string
  description = "NAT for ALB 1c"
}


# route table_name
variable "rt_public_alb_cidr" {
  type        = string
  description = "CIDR block for Route Table ALB"
}

variable "rt_private_eks_cidr" {
  type        = string
  description = "CIDR block for Route Table EKS"
}


# security group
variable "sg_alb" {
  type        = string
  description = "Security Group for Application Load Balancer"
}

variable "sg_eks" {
  type        = string
  description = "Security Group for Elascic Container Service"
}

# ECR
variable "ecr_name" {
  type        = string
  description = "Name for the Elascic Container Regestry"
}

variable "image_tag_mutability" {
  type        = bool
  description = "ECR image tag mutability"
}

# S3 Bucket for Terraform state
variable "s3_bucket_name" {
  description = "The name of the S3 bucket for Terraform state"
  type        = string
}

variable "dynamo_db_table_name" {
  description = "The name of the DynamoDB table for Terraform locks"
  type        = string
}


# EKS Cluster
variable "eks_cluster_version" {
  type        = string
  description = "EKS control plane version"
}

variable "endpoint_public_access" {
  type        = bool
  description = "Whether the EKS cluster endpoint is publicly accessible"
}

variable "node_desired_size" {
  description = "Initial node count"
  type        = number
  default     = 2
}

variable "node_max_size" {
  description = "Maximum number of node"
  type        = number
}

variable "node_min_size" {
  description = "Minimum number of node"
  type        = number
}