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


# route table_name
variable "rt_public_alb_cidr" {
  type        = string
  description = "CIDR block for Route Table ALB"
}

variable "rt_private_eks_cidr" {
  type        = string
  description = "CIDR block for Route Table eks"
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