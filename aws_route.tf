resource "aws_route" "rt_private_transit_gateway" {
  route_table_id         = var.route_table_id
  destination_cidr_block = var.tgw_destination_cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.tgw_vpc_attachment.transit_gateway_id
}
