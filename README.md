# WLZ Blog Platform Services

Infrastructure as Code for the WLZ Blog Platform using Terraform. This repository manages both global and regional AWS resources across multiple regions.

## Overview

This Terraform project creates a multi-region AWS infrastructure with the following components:

- **Global Resources**: Region-independent resources like Route53, WAF, and account-level security settings
- **Regional Resources**: Region-specific resources including VPCs, subnets, security groups, and logging buckets

## Architecture

The infrastructure uses a CIDR splitting strategy to allocate IP address ranges across regions:
- Account CIDR: `10.0.0.0/19` (default, 8192 IPs)
- Each region receives a `/22` subnet (1024 IPs)
- This allows for up to 8 regions while maintaining organized IP addressing

### Enabled Regions

By default, resources are deployed to:
- us-east-1
- us-east-2
- us-west-2
- ap-south-1
- ap-southeast-1

## Usage

```hcl
module "wlz_blog_platform" {
  source = "."
  
  aws_account_id = "123456789012"
  account_cidr   = "10.0.0.0/19"
  
  enabled_regions = [
    "us-east-1",
    "us-west-2",
    "ap-south-1",
    "ap-southeast-1",
    "us-east-2"
  ]
}
```

## Module Structure

```
.
├── modules/
│   ├── global_resources/      # Global AWS resources
│   │   ├── networking/        # Route53, WAF
│   │   └── security/          # Account settings, contacts
│   └── regional_resources/    # Regional AWS resources
│       ├── logging/           # S3 logging buckets
│       └── networking/        # VPC, subnets, security groups
```

## Prerequisites

- Terraform >= 1.0
- AWS credentials configured
- Appropriate IAM permissions for creating global and regional resources

## Deployment

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Review the plan:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

## Outputs

- `global_resources`: All outputs from the global resources module
- `enabled_regions`: List of regions where resources are deployed
- `vpc_cidr_blocks`: CIDR blocks assigned to each region

## Documentation

Detailed documentation for each module can be found in their respective directories:
- [Global Resources](./modules/global_resources/README.md)
- [Regional Resources](./modules/regional_resources/README.md)

<!-- BEGIN_TF_DOCS -->


## Usage

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
| <a name="module_global_resources"></a> [global\_resources](#module\_global\_resources) | ./modules/global_resources | n/a |
| <a name="module_regional_resources"></a> [regional\_resources](#module\_regional\_resources) | ./modules/regional_resources | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_cidr"></a> [account\_cidr](#input\_account\_cidr) | The CIDR block for the AWS account. | `string` | `"10.0.0.0/19"` | no |
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | The AWS Account ID being configured | `string` | n/a | yes |
| <a name="input_aws_account_name"></a> [aws\_account\_name](#input\_aws\_account\_name) | The name of the AWS account being configured | `string` | n/a | yes |
| <a name="input_enabled_regions"></a> [enabled\_regions](#input\_enabled\_regions) | List of regions to enable resources in | `list(string)` | <pre>[<br/>  "us-east-1",<br/>  "us-west-2",<br/>  "ap-south-1",<br/>  "ap-southeast-1",<br/>  "us-east-2"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_enabled_regions"></a> [enabled\_regions](#output\_enabled\_regions) | List of regions that are enabled and have resources deployed |
| <a name="output_global_resources"></a> [global\_resources](#output\_global\_resources) | Global resources module outputs |
| <a name="output_vpc_cidr_blocks"></a> [vpc\_cidr\_blocks](#output\_vpc\_cidr\_blocks) | The CIDR blocks assigned to each region |
<!-- END_TF_DOCS -->
