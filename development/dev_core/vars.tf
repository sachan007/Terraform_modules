
variable "aws_profile" {
  description = "Name of the public subnet of aza"
  default     = "test"
}

variable "private_sub_name" {
  description = "Name of the public subnet of aza"
  default     = "dwh_private_dev_sub_az"
}


variable "private_sub_a_cidr" {
  description = "CIDR block for the public subnet of aza"
  default     = "10.10.14.0/24"
}

variable "private_sub_b_cidr" {
  description = "CIDR block for the public subnet of aza"
  default     = "10.10.16.0/24"
}

variable "region" {
  description = "Region for launching subnets"
  default     = "ap-southeast-1"
}



variable "public_route_table_name" {
  description = "route table"
  default     = "dwh_pub_dev_route"
}


variable "public_sub_name" {
  description = "Name of the public subnet of aza"
  default     = "dwh_pub_dev_sub_az"
}



variable "public_sub_a_cidr" {
  description = "CIDR block for the public subnet of aza"
  default     = "10.10.15.0/24"
}



variable "private_dev_route_table_name" {
  description = "route table"
  default     = "dwh-private-dev-route"
}
