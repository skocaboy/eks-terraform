output "cluster_id" {
  value       = aws_eks_cluster.main.id
  description = "The ID of the EKS cluster"
}

output "node_group_id" {
  value       = aws_eks_node_group.main.id
  description = "The ID of the node group"
}

output "karpenter_role_arn" {
  value       = aws_iam_role.karpenter.arn
  description = "The ARN of the IAM role used by Karpenter"
}
