output "security_group_id" {
  description = "ID of the data tier security group"
  value       = aws_security_group.data_tier.id
}

output "app_tier_security_group_id" {
  description = "ID of the application tier security group"
  value       = aws_security_group.app_tier.id
}


output "web_tier_security_group_id" {
  description = "ID of the web tier security group"
  value       = aws_security_group.web_tier.id
}

output "web_tier_security_group_arn" {
  description = "ARN of the web tier security group"
  value       = aws_security_group.web_tier.arn
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_arn" {
  description = "ARN of the VPC"
  value       = aws_vpc.main.arn
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = aws_subnet.main[*].id
}

output "web_tier_subnet_ids" {
  description = "List of web tier subnet IDs (first 2 subnets)"
  value       = slice(aws_subnet.main[*].id, 0, 2)
}

output "app_tier_subnet_ids" {
  description = "List of app tier subnet IDs (middle 2 subnets)"
  value       = slice(aws_subnet.main[*].id, 2, 4)
}

output "data_tier_subnet_ids" {
  description = "List of data tier subnet IDs (last 2 subnets)"
  value       = slice(aws_subnet.main[*].id, 4, 6)
}