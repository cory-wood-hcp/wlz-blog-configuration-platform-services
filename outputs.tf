output "global_resources" {
  description = "Global resources module outputs"
  value       = module.global_resources
}

output "enabled_regions" {
  description = "List of regions that are enabled and have resources deployed"
  value       = var.enabled_regions
}

output "vpc_cidr_blocks" {
  description = "The CIDR blocks assigned to each region"
  value       = local.regional_cidrs
}