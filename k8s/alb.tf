module "alb" {
  source = "./modules/alb"
 
  account_id = data.aws_caller_identity.current.account_id
}
