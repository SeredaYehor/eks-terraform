output "public_first_subnet_id" {
  value = module.network.public_first_subnet_id
}

output "public_second_subnet_id" {
  value = module.network.public_second_subnet_id
}

output "private_first_subnet_id" {
  value = module.network.private_first_subnet_id
}

output "private_second_subnet_id" {
  value = module.network.private_second_subnet_id
}

output "database_endpoint" {
  value = module.rds.database_endpoint
}
