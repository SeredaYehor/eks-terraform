locals {
  oidc_url = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}
