variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
}

variable "aws_account_id" {
  description = "AWS account ID to deploy resources in"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "The vpc_cidr must be a valid CIDR block."
  }
}