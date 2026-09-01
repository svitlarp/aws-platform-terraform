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

  s3_bucket_name       = "${local.name_prefix}-s3-tfstate"
  dynamo_db_table_name = "${local.name_prefix}-dynamodb-tfstate"
}

# Connecting VPC
module "vpc" {
  source = "./modules/vpc"

  vpc_name = "${local.name_prefix}-vpc"
  vpc_cidr = var.vpc_cidr

  # subnets
  # public subnets ALB
  subnet_alb_a_name = var.subnet_alb_a_name
  subnet_alb_a_cidr = var.subnet_alb_a_cidr
  subnet_alb_a_az   = var.subnet_alb_a_az

  subnet_alb_b_name = var.subnet_alb_b_name
  subnet_alb_b_cidr = var.subnet_alb_b_cidr
  subnet_alb_b_az   = var.subnet_alb_b_az

  subnet_alb_c_name = var.subnet_alb_c_name
  subnet_alb_c_cidr = var.subnet_alb_c_cidr
  subnet_alb_c_az   = var.subnet_alb_c_az


  # private subnets EKS
  subnet_eks_a_name = var.subnet_eks_a_name
  subnet_eks_a_cidr = var.subnet_eks_a_cidr
  subnet_eks_a_az   = var.subnet_eks_a_az

  subnet_eks_b_name = var.subnet_eks_b_name
  subnet_eks_b_cidr = var.subnet_eks_b_cidr
  subnet_eks_b_az   = var.subnet_eks_b_az

  subnet_eks_c_name = var.subnet_eks_c_name
  subnet_eks_c_cidr = var.subnet_eks_c_cidr
  subnet_eks_c_az   = var.subnet_eks_c_az

  # IGW, NAT
  igw_alb_name   = "${local.name_prefix}-igw"
  nat_eks_a_name = "${local.name_prefix}-nat-1a"
  nat_eks_b_name = "${local.name_prefix}-nat-1b"
  nat_eks_c_name = "${local.name_prefix}-nat-1c"

  # Route Tables
  rt_public_alb_cidr  = var.rt_public_alb_cidr
  rt_private_eks_cidr = var.rt_private_eks_cidr

  # Security Groups
  sg_alb = "${local.name_prefix}-sg-alb"
  sg_eks = "${local.name_prefix}-sg-eks"
}

module "ecr" {
  source   = "./modules/ecr"
  ecr_name = "${local.name_prefix}-ecr"
}

# Connecting EKS module
module "eks" {
  source = "./modules/eks"

  eks_cluster_name             = "${local.name_prefix}-eks"
  eks_cluster_version          = var.eks_cluster_version
  eks_cluster_iam_role_name    = "${local.name_prefix}-eks-cluster-role"
  eks_node_group_name          = "${local.name_prefix}-eks-node-group"
  eks_node_group_iam_role_name = "${local.name_prefix}-eks-node-group-role"

  node_desired_size = var.node_desired_size
  node_max_size     = var.node_max_size
  node_min_size     = var.node_min_size

  subnet_ids = [
    module.vpc.subnet_eks_a_id,
    module.vpc.subnet_eks_b_id,
    module.vpc.subnet_eks_c_id
  ]
} 