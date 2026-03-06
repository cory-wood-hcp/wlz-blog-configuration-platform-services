# Regional Logging Module

This module manages S3 buckets for logging in each AWS region.

## Overview

This module creates:
- **S3 Bucket**: Regional logging bucket with unique naming
- **Public Access Block**: Prevents any public access to logs
- **Server-Side Encryption**: AES256 encryption for all objects

## Resources

### S3 Logging Bucket
- **Naming Convention**: `logging-{account_id}-{region}`
- **Purpose**: Centralized logging for regional resources
- **Encryption**: AES256 with bucket keys enabled for cost optimization
- **Public Access**: Completely blocked at the bucket level

### Security Features

#### Public Access Block
All public access is blocked:
- Block public ACLs
- Block public bucket policies
- Ignore public ACLs
- Restrict public buckets

This ensures logs cannot be accidentally exposed.

#### Server-Side Encryption
- **Algorithm**: AES256 (AWS-managed keys)
- **Bucket Keys**: Enabled to reduce encryption costs
- **Default**: All objects are encrypted by default

## Usage

```hcl
module "regional_logging" {
  source = "./modules/regional_resources/logging"
  
  region         = "us-east-1"
  aws_account_id = "123456789012"
  
  # Optional: Custom tags
  common_tags = {
    ManagedBy   = "terraform"
    Module      = "RegionalResourcesLogging"
    Environment = "production"
  }
}
```

## Bucket Naming

The bucket follows the naming convention:
```
logging-{aws_account_id}-{region}
```

For example:
- `logging-123456789012-us-east-1`
- `logging-123456789012-us-west-2`

This ensures:
- Global uniqueness (account ID included)
- Regional identification (region included)
- Clear purpose (logging prefix)

## Notes

- The bucket is created in the specified region
- Tags can be customized via the `common_tags` variable
- Default tags identify the bucket as managed by Terraform

<!-- BEGIN_TF_DOCS -->


## Usage

```hcl
module "regional_logging" {
  source = "./modules/regional_resources/logging"
  
  region         = "us-east-1"
  aws_account_id = "123456789012"
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
| [aws_s3_bucket.logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account ID to deploy resources in | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags to apply to all resources | `map(string)` | <pre>{<br/>  "ManagedBy": "terraform",<br/>  "Module": "RegionalResourcesLogging"<br/>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region to deploy resources in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | ARN of the logging S3 bucket |
<!-- END_TF_DOCS -->

