locals {
  # Split the account CIDR evenly between all possible regions
  # Convert /19 to /22 for each region (splits 8192 IPs into 1024 each for 5 regions)
  # Using /22 gives us room for 8 regions total if needed in the future

  regional_cidrs = {
    us-east-1     = cidrsubnet(var.account_cidr, 3, 0)
    us-east-2     = cidrsubnet(var.account_cidr, 3, 1)
    us-west-2    = cidrsubnet(var.account_cidr, 3, 2)
    ap-south-1    = cidrsubnet(var.account_cidr, 3, 3)
    ap-southeast-1 = cidrsubnet(var.account_cidr, 3, 4)
  }
}

module "regional_resources" {
  for_each = toset(var.enabled_regions)
  source  = "./modules/regional_resources"
  version = "~>0.0.13"
  region = each.value
  aws_account_id = var.aws_account_id
  vpc_cidr = lookup(local.regional_cidrs,each.value)
}

module "global_resources" {
  source  = "./modules/global_resources"
  version = "~>0.0.5"

}

