# terraform-aws-tgw-attachment

Module for attaching a transit gateway to an already existing vpc.

## Transit Gateway Attachment to VPC

To attach a transit gateway (already existing) from another account, set the following variables:

```hcl
module "tgw_attachment" {
  source                     = "git::https://github.com/zoitech/terraform-aws-tgw-attachment.git"
  region                     = "eu-central-1"
  transit_gateway_id         = "tgw-12345678912345678"
  tgw_attachment_tag_name    = "company-network"
  vpc_id                     = "vpc-123456ab"
  subnet_ids                 = ["subnet-a1b23456", "subnet-c2d34567"]
  route_table_id             = "rtb-abcd1234"
  tgw_destination_cidr_block = "192.168.0.0/24"
}
```

For the transit gateway attachment to be successful:

1. The transit gateway resource needs to be shared in the resource access manager to the account ID of the "child" account.
2. The terraform code for the child account referencing this module needs to be applied.
3. The request to attach the transit gateway to the VPC in the "child" account needs to be accepted within the account where the transit gateway exists.

### To Reference A Tagged Version of the Repository

To reference a tagged version of the repository:

```hcl
module "tgw_attachment" {
  source                     = "git::https://github.com/zoitech/terraform-aws-tgw-attachment.git?ref=1.0.1"
  region                     = "eu-central-1"
  transit_gateway_id         = "tgw-12345678912345678"
  tgw_attachment_tag_name    = "company-network"
  vpc_id                     = "vpc-123456ab"
  subnet_ids                 = ["subnet-a1b23456", "subnet-c2d34567"]
  route_table_id             = "rtb-abcd1234"
  tgw_destination_cidr_block = "192.168.0.0/24"
}
```

# Authors
This module is maintained by [Zoi](https://github.com/zoitech).

# License
Licensed under the MIT License. Have a look at the file `LICENSE` for more information.
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ec2_transit_gateway_vpc_attachment.tgw_vpc_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |
| [aws_route.rt_private_transit_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | The AWS region to deploy in | `string` | `"eu-central-1"` | no |
| <a name="input_route_table_id"></a> [route\_table\_id](#input\_route\_table\_id) | The private route table ID where the route for the transit gateway should be added | `any` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs which should be able to transverse the transit gateway | `list(string)` | `null` | no |
| <a name="input_tgw_attachment_tag_name"></a> [tgw\_attachment\_tag\_name](#input\_tgw\_attachment\_tag\_name) | The name tag for the attached transit gateway | `any` | `null` | no |
| <a name="input_tgw_destination_cidr_block"></a> [tgw\_destination\_cidr\_block](#input\_tgw\_destination\_cidr\_block) | The destination traffic to match and route via the transit gateway | `any` | `null` | no |
| <a name="input_transit_gateway_id"></a> [transit\_gateway\_id](#input\_transit\_gateway\_id) | The ID of the transit gateway to attach to the VPC | `any` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID to attach the transit gateway too | `any` | `null` | no |

## Outputs

No outputs.
