data "aws_eks_cluster" "cluster" {
  name = "test-cluster"
}

data "aws_iam_policy" "efs-csi-policy" {
  name = "AmazonEKS_EFS_CSI_Driver_Policy"
}

data "aws_vpc" "cluster_vpc" {
  id = data.aws_eks_cluster.cluster.vpc_config[0].vpc_id
}
