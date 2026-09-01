# Creating EKS-кластера

resource "aws_eks_cluster" "this" {
  name = var.eks_cluster_name

  access_config {
    authentication_mode = "API"  # Authentication via API
    bootstrap_cluster_creator_admin_permissions = true   # Grants rights to the user who created the cluster
  }

  role_arn = aws_iam_role.cluster.arn
  version  = var.eks_cluster_version

  vpc_config {
    endpoint_private_access = true   
    endpoint_public_access  = true  
    subnet_ids = var.subnet_ids
  }

  # Ensure that IAM Role permissions are created before and deleted
  # after EKS Cluster handling. Otherwise, EKS will not be able to
  # properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.cluster_eks_policy,
  ]
}

resource "aws_iam_role" "cluster" {
  name = var.eks_cluster_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cluster_eks_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster.name
}