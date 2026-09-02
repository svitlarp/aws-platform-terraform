# vpc
output "vpc_id" {
  description = "The ID of the VPC main"
  value       = aws_vpc.main.id
}

# subnets
output "subnet_alb_a_id" {
  description = "The ID of the subnet subnet_alb_a"
  value       = aws_subnet.alb_a.id
}

output "subnet_alb_b_id" {
  description = "The ID of the subnet subnet_alb_b"
  value       = aws_subnet.alb_b.id
}

output "subnet_alb_c_id" {
  description = "The ID of the subnet subnet_alb_c"
  value       = aws_subnet.alb_c.id
}

output "subnet_eks_a_id" {
  description = "The ID of the subnet subnet_eks_a"
  value       = aws_subnet.eks_a.id
}

output "subnet_eks_b_id" {
  description = "The ID of the subnet subnet_eks_b"
  value       = aws_subnet.eks_b.id
}

output "subnet_eks_c_id" {
  description = "The ID of the subnet subnet_eks_c"
  value       = aws_subnet.eks_c.id
}

# Internet Gateway
output "igw_alb_id" {
  description = "The ID of the Internet Gateway for Application Load Balancer"
  value       = aws_internet_gateway.alb.id
}

# Elastic IPs
output "eip_eks_a" {
  description = "The ID of the EIP for private subnet a"
  value       = aws_eip.nat_eks_a.id
}

output "eip_eks_b" {
  description = "The ID of the EIP for private subnet b"
  value       = aws_eip.nat_eks_b.id
}

output "eip_eks_c" {
  description = "The ID of the EIP for private subnet c"
  value       = aws_eip.nat_eks_c.id
}


# NAT gateway
output "nat_eks_a_id" {
  description = "The ID of the NAT Gateway for eks"
  value       = aws_nat_gateway.eks_a.id
}

output "nat_eks_b_id" {
  description = "The ID of the NAT Gateway for eks"
  value       = aws_nat_gateway.eks_b.id
}

output "nat_eks_c_id" {
  description = "The ID of the NAT Gateway for eks"
  value       = aws_nat_gateway.eks_c.id
}

# Route tables
output "rt_public_alb_id" {
  description = "The ID of route table ALB"
  value       = aws_route_table.public_alb.id
}

output "rt_private_eks_a_id" {
  description = "The ID of route table eks a"
  value       = aws_route_table.private_eks_a.id
}

output "rt_private_eks_b_id" {
  description = "The ID of route table eks b"
  value       = aws_route_table.private_eks_b.id
}

output "rt_private_eks_c_id" {
  description = "The ID of route table eks c"
  value       = aws_route_table.private_eks_c.id
}

# Security Groups
output "sg_alb" {
  description = "The ID security group ALB"
  value       = aws_security_group.alb.id
}

output "sg_eks" {
  description = "The ID security group eks"
  value       = aws_security_group.eks.id
}