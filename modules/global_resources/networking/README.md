# Global Networking Module

This module manages global networking resources including Route53 CIDR collections and WAF IP sets.

## Overview

This module creates:
- **Route53 CIDR Collection**: For geo-location based routing and traffic management
- **Route53 CIDR Location**: Defines office CIDR blocks for location-based routing
- **WAF IP Set**: Defines IP ranges for Web Application Firewall rules

## Resources

### Route53 CIDR Collection
A collection for managing CIDR blocks used in Route53 geo-proximity routing policies.

### Route53 CIDR Location - Office
Defines CIDR blocks for office locations:
- 200.5.3.0/24
- 200.6.3.0/24

### WAF IP Set
Defines IP ranges for WAF rules:
- 192.0.7.0/24
- 10.16.16.0/16

## Usage

```hcl
module "global_networking" {
  source = "./modules/global_resources/networking"
  
  aws_account_name = "my-aws-account"
}
```

## Notes

- This module creates global resources that are not tied to a specific region
- WAF resources created here are for AWS WAF Classic (regional WAF)
- Update the CIDR blocks to match your organization's actual IP ranges

<!-- BEGIN_TF_DOCS -->


## Usage

```hcl
module "global_networking" {
  source = "./modules/global_resources/networking"
  
  aws_account_name = "my-aws-account"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_cidr_collection.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_cidr_collection) | resource |
| [aws_route53_cidr_location.office_cidrs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_cidr_location) | resource |
| [aws_waf_ipset.ipset](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_ipset) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_name"></a> [aws\_account\_name](#input\_aws\_account\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

