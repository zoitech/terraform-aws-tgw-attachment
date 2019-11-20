resource "aws_ram_resource_share_accepter" "tgw_vpc_attachment" {
  share_arn = var.share_arn
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc_attachment" {
  subnet_ids         = var.subnet_ids
  transit_gateway_id = var.transit_gateway_id
  vpc_id             = var.vpc_id

  tags = {
    Name = var.tgw_attachment_tag_name
  }

  depends_on = [
    aws_ram_resource_share_accepter.tgw_vpc_attachment,
  ]
}
