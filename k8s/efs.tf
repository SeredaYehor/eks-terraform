module "efs" {
  source = "./modules/efs"

  first_subnet  = var.first_subnet
  second_subnet = var.second_subnet
  region        = var.region
  account_id    = data.aws_caller_identity.current.account_id
}
