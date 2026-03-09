module "global_networking" {
  source           = "./networking"
  aws_account_name = var.aws_account_name
}

module "global_security" {
  source           = "./security"
  operations_email = var.operations_email
  security_email   = var.security_email
}