# # Data source to get current AWS account ID
# data "aws_caller_identity" "current" {}

# Data source to get current AWS region
# data "aws_region" "current" {}

# Data source to get available AZs for the VPC
data "aws_availability_zones" "available" {
  state  = "available"
  region = var.region
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  region               = var.region
  tags = merge(var.common_tags, {
    Name    = "vpc-${var.aws_account_id}-${var.region}"
    Purpose = "main-vpc"
  })
}

# Create six subnets evenly distributed across availability zones
resource "aws_subnet" "main" {
  count             = 6
  region            = var.region
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 3, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]

  map_public_ip_on_launch = false

  tags = merge(var.common_tags, {
    Name = "subnet-${count.index + 1}-${data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]}"
    Tier = count.index < 2 ? "web" : count.index < 4 ? "app" : "data"
  })
}