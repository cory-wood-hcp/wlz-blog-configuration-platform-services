variable "account_cidr" {
  description = "The CIDR block for the AWS account."
  type        = string
  default     = "10.0.0.0/19"
}

variable "enabled_regions" {
  description = "List of regions to enable resources in"
  type        = list(string)
  default     = ["us-east-1", "us-west-2", "ap-south-1", "ap-southeast-1", "us-east-2"]

}

variable "aws_account_id" {
  description = "The AWS Account ID being configured "
  type        = string
}

variable "aws_account_name" {
  description = "The name of the AWS account being configured"
  type        = string
}