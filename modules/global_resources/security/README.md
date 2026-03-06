# Global Security Module

This module manages account-level security settings and configurations.

## Overview

This module creates:
- **S3 Account Public Access Block**: Blocks all public access to S3 buckets at the account level
- **AWS Account Alternate Contacts**: Sets up security and operations team contact information

## Resources

### S3 Account Public Access Block
Enforces security best practices by blocking:
- Public ACLs
- Public bucket policies
- Ignoring public ACLs
- Restricting public buckets

This provides a safety net to prevent accidental public exposure of S3 data.

### AWS Account Alternate Contacts

#### Security Contact
- **Name**: Security Team
- **Title**: Security Team
- **Email**: Configured via `security_email` variable
- **Phone**: (800) 555-0100

#### Operations Contact
- **Name**: Operations Team
- **Title**: Operations Team
- **Email**: Configured via `operations_email` variable
- **Phone**: (800) 555-0101

## Usage

```hcl
module "global_security" {
  source = "./modules/global_resources/security"
  
  operations_email = "ops@example.com"
  security_email   = "security@example.com"
}
```

## Notes

- The S3 public access block applies to all S3 buckets in the AWS account
- Update the phone numbers to match your organization's actual contact numbers
- Alternate contacts receive AWS communications about security and operational issues

<!-- BEGIN_TF_DOCS -->


## Usage

```hcl
module "global_security" {
  source = "./modules/global_resources/security"
  
  operations_email = "ops@example.com"
  security_email   = "security@example.com"
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
| [aws_account_alternate_contact.operations](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/account_alternate_contact) | resource |
| [aws_account_alternate_contact.security](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/account_alternate_contact) | resource |
| [aws_s3_account_public_access_block.s3_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_account_public_access_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_operations_email"></a> [operations\_email](#input\_operations\_email) | n/a | `string` | n/a | yes |
| <a name="input_security_email"></a> [security\_email](#input\_security\_email) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

