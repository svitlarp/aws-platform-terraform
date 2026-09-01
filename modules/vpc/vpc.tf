
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

# subnets
# public subnets
# subnet_alb_a 
resource "aws_subnet" "alb_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_alb_a_cidr
  availability_zone = var.subnet_alb_a_az

  tags = {
    Name = var.subnet_alb_a_name
    Project = var.project
    Environment = var.environment
    Tier = "public"
    Purpose = "alb"
  }
}

# subnet_alb_b 
resource "aws_subnet" "alb_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_alb_b_cidr
  availability_zone = var.subnet_alb_b_az

  tags = {
    Name = var.subnet_alb_b_name
    Project = var.project
    Environment = var.environment
    Tier = "public"
    Purpose = "alb"
  }
}

# subnet_alb_c 
resource "aws_subnet" "alb_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_alb_c_cidr
  availability_zone = var.subnet_alb_c_az

  tags = {
    Name = var.subnet_alb_c_name
    Project = var.project
    Environment = var.environment
    Tier = "public"
    Purpose = "alb"
  }
}

# private subnets
# subnet_eks_a 
resource "aws_subnet" "eks_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_eks_a_cidr
  availability_zone = var.subnet_eks_a_az

  tags = {
    Name = var.subnet_eks_a_name
    Project = var.project
    Environment = var.environment
    Tier = "private"
    Purpose = "eks"
  }
}

# subnet_eks_b 
resource "aws_subnet" "eks_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_eks_b_cidr
  availability_zone = var.subnet_eks_b_az

  tags = {
    Name = var.subnet_eks_b_name
    Project = var.project
    Environment = var.environment
    Tier = "private"
    Purpose = "eks"
  }
}

# subnet_eks_c
resource "aws_subnet" "eks_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_eks_c_cidr
  availability_zone = var.subnet_eks_c_az

  tags = {
    Name = var.subnet_eks_c_name
    Project = var.project
    Environment = var.environment
    Tier = "private"
    Purpose = "eks"
  }
}


# igw
resource "aws_internet_gateway" "alb" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_alb_name
  }
}

# EIPs
# eip nat eks_a
resource "aws_eip" "nat_eks_a" {
  domain = "vpc"
  tags   = { Name = "${var.nat_eks_a_name}-eip" }
}

# eip nat eks_b
resource "aws_eip" "nat_eks_b" {
  domain = "vpc"
  tags   = { Name = "${var.nat_eks_b_name}-eip" }
}

# eip nat eks_c
resource "aws_eip" "nat_eks_c" {
  domain = "vpc"
  tags   = { Name = "${var.nat_eks_c_name}-eip" }
}

# nat subnet_eks_a
resource "aws_nat_gateway" "eks_a" {
  allocation_id = aws_eip.nat_eks_a.id
  subnet_id     = aws_subnet.alb_a.id # Public subnet

  tags = {
    Name = var.nat_eks_a_name
  }
  depends_on = [aws_internet_gateway.alb]
}

# nat subnet_eks_b
resource "aws_nat_gateway" "eks_b" {
  allocation_id = aws_eip.nat_eks_b.id
  subnet_id     = aws_subnet.alb_b.id # Public subnet

  tags = {
    Name = var.nat_eks_b_name
  }
  depends_on = [aws_internet_gateway.alb]
}

# nat subnet_eks_c
resource "aws_nat_gateway" "eks_c" {
  allocation_id = aws_eip.nat_eks_c.id
  subnet_id     = aws_subnet.alb_c.id # Public subnet

  tags = {
    Name = var.nat_eks_c_name
  }
  depends_on = [aws_internet_gateway.alb]
}
