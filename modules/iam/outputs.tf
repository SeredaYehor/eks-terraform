output "eks_iam_role" {
  value = aws_iam_role.eks-iam-role.arn
}

output "node_group_iam_role" {
  value = aws_iam_role.workernodes.arn
}

