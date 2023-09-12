resource "null_resource" "kubectl" {
  depends_on = [module.eks]
  provisioner "local-exec" {
    command = "aws eks --region ${var.region} update-kubeconfig --name test-cluster --kubeconfig .kube-config"
  }
}
