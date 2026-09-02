variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "endpoint_public_access" {
  type        = bool
  description = "Whether the EKS cluster endpoint is publicly accessible"
}

variable "eks_cluster_iam_role_name" {
  description = "Name of the IAM Role for the EKS cluster"
  type        = string
}

variable "eks_node_group_name" {
  description = "Name of the EKS Node Group"
  type        = string
}

variable "eks_node_group_iam_role_name" {
  description = "Name of the IAM Role for the EKS node group"
  type        = string
}

variable "eks_cluster_version" {
  description = "Kubernetes version for the control plane"
  type        = string
}

variable "instance_types" {
  description = "Type of EC2 instance"
  type        = string
}

variable "node_capacity_type" {
  description = "Capacity type for EKS worker nodes, such as ON_DEMAND or SPOT"
  type        = string
}


# EKS Subnet-IDs
variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for EKS Cluster"
}


variable "node_desired_size" {
  description = "Desired number of node"
  type        = number
}

variable "node_max_size" {
  description = "Maximum number of node"
  type        = number
}

variable "node_min_size" {
  description = "Minimum number of node"
  type        = number
}



