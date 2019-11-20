# terraform-aws-tgw-attachment

Module for attaching a transit gateway to an already existing vpc.

## Transit Gateway Attachment to VPC

To attach a transit gateway (already existing) from another account, set the following variables:

```hcl
module "tgw_attachment" {
  source                     = "git::https://github.com/zoitech/terraform-aws-tgw-attachment.git"
  region                     = "eu-central-1"
  share_arn                  = "arn:aws:ram:eu-central-1:123456789123:resource-share/7ab74438-4ac2-0780-745d-1bf765ab5d7c"
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
  share_arn                  = "arn:aws:ram:eu-central-1:123456789123:resource-share/7ab74438-4ac2-0780-745d-1bf765ab5d7c"
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
