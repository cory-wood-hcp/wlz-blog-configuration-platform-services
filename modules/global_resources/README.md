# Global Resources Module

This module manages global (region-independent) AWS resources for the WLZ Blog Platform.

## Overview

The global resources module consists of two main submodules:

1. **Networking**: Manages Route53 CIDR collections and WAF IP sets
2. **Security**: Manages account-level security settings and alternate contacts

## Components

### Networking
- Route53 CIDR collections for geo-location routing
- WAF IP sets for access control

### Security
- S3 account-level public access blocks
- AWS account alternate contacts (Security and Operations)

## Usage

```hcl
module "global_resources" {
  source = "./modules/global_resources"
  
  aws_account_name  = "my-aws-account"
  operations_email  = "ops@example.com"
  security_email    = "security@example.com"
}
```

## Submodules

- [Networking](./networking/README.md)
- [Security](./security/README.md)

<!-- BEGIN_TF_DOCS -->


## Usage

```hcl
module "global_resources" {
  source = "./modules/global_resources"
  
  aws_account_name  = "my-aws-account"
  operations_email  = "ops@example.com"
  security_email    = "security@example.com"
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
| <a name="module_global_networking"></a> [global\_networking](#module\_global\_networking) | ./networking | n/a |
| <a name="module_global_security"></a> [global\_security](#module\_global\_security) | ./security | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_name"></a> [aws\_account\_name](#input\_aws\_account\_name) | n/a | `string` | n/a | yes |
| <a name="input_operations_email"></a> [operations\_email](#input\_operations\_email) | n/a | `string` | n/a | yes |
| <a name="input_security_email"></a> [security\_email](#input\_security\_email) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

