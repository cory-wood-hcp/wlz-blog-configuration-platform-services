variable "security_group_name" {
  description = "Name for the data tier security group"
  type        = string
  default     = "data-tier-sg"
}

variable "app_tier_security_group_name" {
  description = "Name for the application tier security group"
  type        = string
  default     = "app-tier-sg"
}

variable "web_tier_security_group_name" {
  description = "Name for the web tier security group"
  type        = string
  default     = "web-tier-sg"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "The vpc_cidr must be a valid CIDR block."
  }
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    ManagedBy = "terraform"
    Module    = "RegionalResourcesNetworking"
  }
}

variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
}

variable "aws_account_id" {
  description = "AWS account ID to deploy resources in"
  type        = string
}