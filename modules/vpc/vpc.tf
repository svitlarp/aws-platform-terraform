
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

# subnets
# subnet_alb_a 
resource "aws_subnet" "alb_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_alb_a_cidr
  availability_zone = var.subnet_alb_a_az

  tags = {
    Name = var.subnet_alb_a_name
  }
}

# subnet_alb_b 
resource "aws_subnet" "alb_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_alb_b_cidr
  availability_zone = var.subnet_alb_b_az

  tags = {
    Name = var.subnet_alb_b_name
  }
}

# subnet_eks_a 
resource "aws_subnet" "eks_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_eks_a_cidr
  availability_zone = var.subnet_eks_a_az

  tags = {
    Name = var.subnet_eks_a_name
  }
}

# subnet_eks_b 
resource "aws_subnet" "eks_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_eks_b_cidr
  availability_zone = var.subnet_eks_b_az

  tags = {
    Name = var.subnet_eks_b_name
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

# route tables
resource "aws_route_table" "public_alb" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.rt_public_alb_cidr
    gateway_id = aws_internet_gateway.alb.id
  }

}

resource "aws_route_table" "private_eks_a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = var.rt_private_eks_cidr
    nat_gateway_id = aws_nat_gateway.eks_a.id
  }

}

resource "aws_route_table" "private_eks_b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = var.rt_private_eks_cidr
    nat_gateway_id = aws_nat_gateway.eks_b.id
  }

}

# route table assocoations
resource "aws_route_table_association" "alb_a" {
  subnet_id      = aws_subnet.alb_a.id
  route_table_id = aws_route_table.public_alb.id
}

resource "aws_route_table_association" "alb_b" {
  subnet_id      = aws_subnet.alb_b.id
  route_table_id = aws_route_table.public_alb.id
}

resource "aws_route_table_association" "eks_a" {
  subnet_id      = aws_subnet.eks_a.id
  route_table_id = aws_route_table.private_eks_a.id
}

resource "aws_route_table_association" "eks_b" {
  subnet_id      = aws_subnet.eks_b.id
  route_table_id = aws_route_table.private_eks_b.id
}