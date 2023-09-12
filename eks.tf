module "eks" {
  source = "./modules/eks"

  depends_on = [ module.iam, module.network]
  first_subnet = module.network.private_first_subnet_id
  second_subnet = module.network.private_second_subnet_id
  third_subnet = module.network.public_first_subnet_id
  fourth_subnet = module.network.public_second_subnet_id
  eks_iam_role = module.iam.eks_iam_role
  node_group_iam_role = module.iam.node_group_iam_role

  environment = var.environment
}
