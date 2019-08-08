
variable "aws_profile" {
  description = "Name of the public subnet of aza"
  default     = "test"
}

variable "private_sub_name" {
  description = "Name of the public subnet of aza"
  default     = "dwh_private_stag_sub_az"
}


variable "private_sub_a_cidr" {
  description = "CIDR block for the public subnet of aza"
  default     = "10.10.1.0/24"
}

variable "private_sub_b_cidr" {
  description = "CIDR block for the public subnet of aza"
  default     = "10.10.2.0/24"
}

variable "region" {
  description = "Region for launching subnets"
  default     = "ap-southeast-1"
}



variable "public_route_table_name" {
  description = "route table"
  default     = "dwh_pub_stag_route"
}


variable "public_sub_name" {
  description = "Name of the public subnet of aza"
  default     = "dwh_pub_stag_sub_az"
}



variable "public_sub_a_cidr" {
  description = "CIDR block for the public subnet of aza"
  default     = "10.10.3.0/24"
}



variable "private_stag_route_table_name" {
  description = "route table"
  default     = "dwh-private-stag-route"
}
