variable "region" {
  description = "The AWS region to deploy in"
  default     = "eu-central-1"
}

variable "route_table_id" {
  description = "The private route table ID where the route for the transit gateway should be added"
  default     = null
}

variable "tgw_destination_cidr_block" {
  description = "The destination traffic to match and route via the transit gateway"
  default     = null
}

variable "tgw_attachment_tag_name" {
  description = "The name tag for the attached transit gateway"
  default     = null
}

variable "transit_gateway_id" {
  description = "The ID of the transit gateway to attach to the VPC"
  default     = null
}

variable "vpc_id" {
  description = "The VPC ID to attach the transit gateway too"
  default     = null
}

variable "subnet_ids" {
  description = "List of subnet IDs which should be able to transverse the transit gateway"
  type        = list(string)
  default     = null
}
