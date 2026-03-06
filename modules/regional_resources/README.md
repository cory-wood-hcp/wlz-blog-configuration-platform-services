# Regional Resources Module

This module manages region-specific AWS resources for the WLZ Blog Platform.

## Overview

The regional resources module consists of two main submodules:

1. **Networking**: Manages VPC, subnets, and security groups
2. **Logging**: Manages S3 buckets for regional logging

## Components

### Networking
- VPC with customizable CIDR block
- 6 subnets distributed across availability zones
- Security groups for web, app, and data tiers

### Logging
- Regional S3 bucket for logging
- Server-side encryption enabled
- Public access blocked

## Architecture

Each region receives:
- 1 VPC with the specified CIDR block
- 6 subnets evenly distributed across availability zones:
  - 2 web tier subnets
  - 2 app tier subnets
  - 2 data tier subnets
- 3 security groups (web, app, data tiers)
- 1 logging S3 bucket

## Usage

```hcl
module "regional_resources" {
  source = "./modules/regional_resources"
  
  region         = "us-east-1"
  aws_account_id = "123456789012"
  vpc_cidr       = "10.0.0.0/22"
}
```

## Submodules

- [Networking](./networking/README.md)
- [Logging](./logging/README.md)

<!-- BEGIN_TF_DOCS -->


## Usage

```hcl
module "regional_resources" {
  source = "./modules/regional_resources"
  
  region         = "us-east-1"
  aws_account_id = "123456789012"
  vpc_cidr       = "10.0.0.0/22"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_regional_logging"></a> [regional\_logging](#module\_regional\_logging) | ./logging | n/a |
| <a name="module_regional_networking"></a> [regional\_networking](#module\_regional\_networking) | ./networking | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account ID to deploy resources in | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region to deploy resources in | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for the VPC | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

