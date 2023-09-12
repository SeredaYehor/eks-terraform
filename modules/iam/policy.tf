resource "aws_iam_policy" "efs-csi-policy" {
    name = "AmazonEKS_EFS_CSI_Driver_Policy"

    policy = file("modules/iam/efs-policy.json")
}
