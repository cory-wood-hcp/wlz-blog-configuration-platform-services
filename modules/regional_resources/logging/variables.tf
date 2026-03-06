variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
}

variable "aws_account_id" {
  description = "AWS account ID to deploy resources in"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    ManagedBy = "terraform"
    Module    = "RegionalResourcesLogging"
  }
}