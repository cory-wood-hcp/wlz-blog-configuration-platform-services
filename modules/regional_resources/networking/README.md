# Regional Networking Module

This module manages regional networking resources including VPC, subnets, and security groups for a three-tier architecture.

## Overview

This module creates:
- **VPC**: With DNS support and custom CIDR block
- **Subnets**: 6 subnets distributed across availability zones
- **Security Groups**: Three-tier security architecture (web, app, data)

## Architecture

### VPC Configuration
- Configurable CIDR block (typically /22 for 1024 IPs)
- DNS hostnames and DNS support enabled
- Tagged with account ID and region

### Subnet Layout
Creates 6 subnets automatically distributed across all available AZs:
- **Subnets 1-2**: Web tier (public-facing)
- **Subnets 3-4**: Application tier (internal)
- **Subnets 5-6**: Data tier (databases, caches)

Each subnet gets a /25 CIDR (128 IPs) from the VPC CIDR.

### Security Groups

#### Web Tier Security Group
- Allows HTTP (80) and HTTPS (443) from anywhere
- Allows all outbound traffic
- Serves as the entry point for external traffic

#### App Tier Security Group
- Allows all traffic from web tier security group
- Allows all outbound traffic
- Isolated from direct external access

#### Data Tier Security Group
- Allows database traffic from app tier:
  - MySQL/MariaDB (3306)
  - PostgreSQL (5432)
  - Microsoft SQL Server (1433)
  - Oracle Database (1521)
  - MongoDB (27017)
  - Redis (6379)
  - Memcached (11211)
  - Elasticsearch (9200)
- Allows all outbound traffic

## Usage

```hcl
module "regional_networking" {
  source = "./modules/regional_resources/networking"
  
  region         = "us-east-1"
  aws_account_id = "123456789012"
  vpc_cidr       = "10.0.0.0/22"
  
  # Optional: Override security group names
  web_tier_security_group_name  = "custom-web-sg"
  app_tier_security_group_name  = "custom-app-sg"
  security_group_name           = "custom-data-sg"
}
```

## Security Best Practices

1. **Defense in Depth**: Three-tier architecture isolates components
2. **Least Privilege**: Each tier only allows necessary traffic
3. **No Public IPs**: Subnets don't auto-assign public IPs
4. **Security Group References**: Uses SG IDs instead of CIDR blocks for inter-tier communication

<!-- BEGIN_TF_DOCS -->


## Usage

```hcl
module "regional_networking" {
  source = "./modules/regional_resources/networking"
  
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

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.app_tier](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.data_tier](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.web_tier](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_tier_security_group_name"></a> [app\_tier\_security\_group\_name](#input\_app\_tier\_security\_group\_name) | Name for the application tier security group | `string` | `"app-tier-sg"` | no |
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account ID to deploy resources in | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags to apply to all resources | `map(string)` | <pre>{<br/>  "ManagedBy": "terraform",<br/>  "Module": "RegionalResourcesNetworking"<br/>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region to deploy resources in | `string` | n/a | yes |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Name for the data tier security group | `string` | `"data-tier-sg"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for the VPC | `string` | n/a | yes |
| <a name="input_web_tier_security_group_name"></a> [web\_tier\_security\_group\_name](#input\_web\_tier\_security\_group\_name) | Name for the web tier security group | `string` | `"web-tier-sg"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_tier_security_group_id"></a> [app\_tier\_security\_group\_id](#output\_app\_tier\_security\_group\_id) | ID of the application tier security group |
| <a name="output_app_tier_subnet_ids"></a> [app\_tier\_subnet\_ids](#output\_app\_tier\_subnet\_ids) | List of app tier subnet IDs (middle 2 subnets) |
| <a name="output_data_tier_subnet_ids"></a> [data\_tier\_subnet\_ids](#output\_data\_tier\_subnet\_ids) | List of data tier subnet IDs (last 2 subnets) |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | ID of the data tier security group |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | List of subnet IDs |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | ARN of the VPC |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | CIDR block of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the VPC |
| <a name="output_web_tier_security_group_arn"></a> [web\_tier\_security\_group\_arn](#output\_web\_tier\_security\_group\_arn) | ARN of the web tier security group |
| <a name="output_web_tier_security_group_id"></a> [web\_tier\_security\_group\_id](#output\_web\_tier\_security\_group\_id) | ID of the web tier security group |
| <a name="output_web_tier_subnet_ids"></a> [web\_tier\_subnet\_ids](#output\_web\_tier\_subnet\_ids) | List of web tier subnet IDs (first 2 subnets) |
<!-- END_TF_DOCS -->

