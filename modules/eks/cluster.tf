resource "aws_eks_cluster" "eks-cluster" {
 name = "test-cluster"
 role_arn = var.eks_iam_role

 vpc_config {
  subnet_ids = [var.first_subnet, var.second_subnet, var.third_subnet, var.fourth_subnet]
 }
}

resource "aws_eks_node_group" "worker-node-group" {
  cluster_name  = aws_eks_cluster.eks-cluster.name
  node_group_name = "test-workernodes"
  node_role_arn  = var.node_group_iam_role
  subnet_ids   = [var.first_subnet, var.second_subnet]
  instance_types = ["t3.small"]
 
  scaling_config {
   desired_size = 1
   max_size   = 2
   min_size   = 1
  }
}
