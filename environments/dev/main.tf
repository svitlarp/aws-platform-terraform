terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
}

provider "aws" {
  region = var.aws_region
}

locals {
  name_prefix = "${var.project}-${var.environment}"
}

module "s3" {
  source = "./modules/s3-backend"

  s3_bucket_name       = "${locals.name_prefix}-s3-tfstate
  dynamo_db_table_name = "${locals.name_prefix}-dynamodb-tfstate"
}

# Connecting VPC
module "vpc" {
  source = "./modules/vpc"

  vpc_name = "${locals.name_prefix}-vpc"
  vpc_cidr = var.vpc_cidr

  # subnets
  # public subnets ALB
  subnet_alb_a_name = var.subnet_alb_a_name
  subnet_alb_a_cidr = var.subnet_alb_a_cidr
  subnet_alb_a_az   = var.subnet_alb_a_az

  subnet_alb_b_name = var.subnet_alb_b_name
  subnet_alb_b_cidr = var.subnet_alb_b_cidr
  subnet_alb_b_az   = var.subnet_alb_b_az

  subnet_alb_c_name = "subnet-public-alb-1c"
  subnet_alb_c_cidr = "10.0.3.0/24"
  subnet_alb_c_az   = "eu-north-1c"


  # private subnets EKS
  subnet_eks_a_name = var.subnet_eks_a_name
  subnet_eks_a_cidr = var.subnet_eks_a_cidr
  subnet_eks_a_az   = var.subnet_eks_a_az

  subnet_eks_b_name = var.subnet_eks_b_name
  subnet_eks_b_cidr = var.subnet_eks_b_cidr
  subnet_eks_b_az   = var.subnet_eks_b_az

  subnet_eks_c_name = "subnet-private-eks-1c"
  subnet_eks_c_cidr = "10.0.6.0/24"
  subnet_eks_c_az   = "eu-north-1c"

  # IGW, NAT
  igw_alb_name   = "${locals.name_prefix}-igw"
  nat_eks_a_name = "${locals.name_prefix}-nat-1a"
  nat_eks_b_name = "${locals.name_prefix}-nat-1b"
  nat_eks_c_name = "${locals.name_prefix}-nat-1c"

  # Route Tables
  rt_public_alb_cidr  = var.rt_public_alb_cidr
  rt_private_eks_cidr = var.rt_private_eks_cidr

  # Security Groups
  sg_alb = "${locals.name_prefix}-sg-alb"
  sg_eks = "${locals.name_prefix}-sg-eks"
}

module "ecr" {
  source   = "./modules/ecr"
  ecr_name = "${locals.name_prefix}-ecr"
}