provider "aws" {
  region = var.aws_region
}

module "s3" {
  source = "./modules/s3-backend"

  s3_bucket_name       = var.s3_bucket_name
  dynamo_db_table_name = var.dynamo_db_table_name
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name = "${var.vpc_name}-vpc"
  vpc_cidr = var.vpc_cidr

  # Public subnet ALB
  subnet_alb_a_name = var.subnet_alb_a_name
  subnet_alb_a_cidr = var.subnet_alb_a_cidr
  subnet_alb_a_az   = var.subnet_alb_a_az

  subnet_alb_b_name = var.subnet_alb_b_name
  subnet_alb_b_cidr = var.subnet_alb_b_cidr
  subnet_alb_b_az   = var.subnet_alb_b_az

  # Private Subnet eks
  subnet_eks_a_name = var.subnet_eks_a_name
  subnet_eks_a_cidr = var.subnet_eks_a_cidr
  subnet_eks_a_az   = var.subnet_eks_a_az

  subnet_eks_b_name = var.subnet_eks_b_name
  subnet_eks_b_cidr = var.subnet_eks_b_cidr
  subnet_eks_b_az   = var.subnet_eks_b_az

  # IGW, NAT
  igw_alb_name   = var.igw_alb_name
  nat_eks_a_name = var.nat_eks_a_name
  nat_eks_b_name = var.nat_eks_b_name

  # Route Tables
  rt_public_alb_cidr  = var.rt_public_alb_cidr
  rt_private_eks_cidr = var.rt_private_eks_cidr

  # Security Groups
  sg_alb = var.sg_alb
  sg_eks = var.sg_eks
}

module "ecr" {
  source   = "./modules/ecr"
  ecr_name = var.ecr_name
}