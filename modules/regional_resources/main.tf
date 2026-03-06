module "regional_networking" {
  source         = "./networking"
  aws_account_id = var.aws_account_id
  region         = var.region
  vpc_cidr       = var.vpc_cidr
}

module "regional_logging" {
  source         = "./logging"
  aws_account_id = var.aws_account_id
  region         = var.region
}