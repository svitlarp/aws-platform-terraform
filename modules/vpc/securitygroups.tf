# Application Load Balancer

resource "aws_security_group" "alb" {
  name        = var.sg_alb
  description = "Allows HTTP traffic from internet"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = var.sg_alb
  }
}


# internet -> ALB :80
resource "aws_vpc_security_group_ingress_rule" "alb_from_http" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# ALB -> eks :3000
resource "aws_vpc_security_group_egress_rule" "alb_to_eks" {
  security_group_id            = aws_security_group.alb.id
  referenced_security_group_id = aws_security_group.eks.id # ??
  from_port                    = 3000
  ip_protocol                  = "tcp"
  to_port                      = 3000
}



# Elascic Kubernetes Service (eks)

resource "aws_security_group" "eks" {
  name        = var.sg_eks
  description = "Allows 3000 from ALB, 443 out for AWS services"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = var.sg_eks
  }
}

# ALB -> eks :3000
resource "aws_vpc_security_group_ingress_rule" "eks_from_alb" {
  security_group_id            = aws_security_group.eks.id
  referenced_security_group_id = aws_security_group.alb.id
  from_port                    = 3000
  ip_protocol                  = "tcp"
  to_port                      = 3000
}

# eks -> AWS services :443 (to reach ECR)
resource "aws_vpc_security_group_egress_rule" "eks_https_out" {
  security_group_id = aws_security_group.eks.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}