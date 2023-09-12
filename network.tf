module "network" {
  source = "./modules/network"

  region      = var.region
  environment = var.environment
}
