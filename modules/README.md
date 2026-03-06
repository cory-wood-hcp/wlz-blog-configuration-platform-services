# Modules

This directory contains the Terraform modules for the WLZ Blog Platform Services.

## Available Modules

- [global_resources](./global_resources/README.md) - Global AWS resources (Route53, WAF, account settings)
- [regional_resources](./regional_resources/README.md) - Regional AWS resources (VPC, subnets, security groups, logging)

## Module Structure

Each module is self-contained and can be used independently or as part of the larger infrastructure.

### Global Resources
Manages AWS resources that are not tied to a specific region:
- Route53 CIDR collections
- WAF IP sets
- Account-level security settings
- Alternate contacts

### Regional Resources
Manages AWS resources that are deployed in each enabled region:
- VPC and subnets
- Security groups for three-tier architecture
- S3 buckets for regional logging

## Usage Pattern

The root module orchestrates both global and regional resources:

```hcl
# Global resources (deployed once)
module "global_resources" {
  source = "./modules/global_resources"
  # ... variables
}

# Regional resources (deployed per region)
module "regional_resources" {
  for_each = toset(var.enabled_regions)
  source   = "./modules/regional_resources"
  region   = each.value
  # ... variables
}
```

<!-- BEGIN_TF_DOCS -->
# Modules

This directory contains the Terraform modules for the WLZ Blog Platform Services.

## Available Modules

- [global_resources](./global_resources/README.md) - Global AWS resources (Route53, WAF, account settings)
- [regional_resources](./regional_resources/README.md) - Regional AWS resources (VPC, subnets, security groups, logging)

## Module Structure

Each module is self-contained and can be used independently or as part of the larger infrastructure.

## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->

