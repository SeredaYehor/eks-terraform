resource "aws_iam_role_policy_attachment" "AmazonEKS_EFS_CSI_Driver_Policy_attach" {
  policy_arn = data.aws_iam_policy.efs-csi-policy.arn
  role    = aws_iam_role.efs-csi-driver-role.name
}
