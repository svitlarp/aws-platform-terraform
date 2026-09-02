# EKS cluster
output "eks_cluster_name" {
    description = "The Name of EKS Cluster"
    value = aws_eks_cluster.this.name
}

output "eks_cluster_id" {
    description = "The Name of EKS Cluster"
    value = aws_eks_cluster.this.id
}

output "eks_cluster_iam_role_arn" {
    description = "The Name of EKS IAM Role"
    value = aws_iam_role.cluster.arn
}

output "eks_cluster_iam_role_id" {
    description = "The ID of EKS IAM Role"
    value = aws_iam_role.cluster.unique_id
}


# EKS Node Group
output "eks_node_group_name" {
  description = "The Name of EKS Node Group"
  value       = aws_eks_node_group.this.node_group_name
}

output "eks_node_group_id" {
  description = "The ID of EKS Node Group"
  value       = aws_eks_node_group.this.id
}

output "eks_node_group_iam_role_arn" {
  description = "The Name of EKS Node Group IAM Role"
  value       = aws_iam_role.node.arn
}

output "eks_node_group_iam_role_id" {
  description = "The ID of EKS Node Group IAM Role"
  value       = aws_iam_role.node.id
}
