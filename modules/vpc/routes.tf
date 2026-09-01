
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

resource "aws_route_table" "private_eks_c" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = var.rt_private_eks_cidr
    nat_gateway_id = aws_nat_gateway.eks_c.id
  }
}

# route table association
resource "aws_route_table_association" "alb_a" {
  subnet_id      = aws_subnet.alb_a.id
  route_table_id = aws_route_table.public_alb.id
}

resource "aws_route_table_association" "alb_b" {
  subnet_id      = aws_subnet.alb_b.id
  route_table_id = aws_route_table.public_alb.id
}

resource "aws_route_table_association" "alb_c" {
  subnet_id      = aws_subnet.alb_c.id
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

resource "aws_route_table_association" "eks_c" {
  subnet_id      = aws_subnet.eks_c.id
  route_table_id = aws_route_table.private_eks_c.id
}