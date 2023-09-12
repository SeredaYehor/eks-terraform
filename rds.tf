module "rds" {
  source = "./modules/rds"

  depends_on = [ module.iam, module.network]
  first_private_sub_id = module.network.private_first_subnet_id
  second_private_sub_id = module.network.private_second_subnet_id
  vpc_id = module.network.vpc_id
  database_password = var.database_password

  environment = var.environment
}
