
variable "aws_profile" {
  description = "Name of the public subnet of aza"
  default     = "test"
}

variable "private_db_sub_name" {
  description = "Name of the public subnet"
  default     = "dwh_private_prod_db_sub_az"
}


variable "private_db_sub_a_cidr" {
  description = "CIDR block for the private subnet of aza"
  default     = "10.10.14.0/24"
}

variable "private_db_sub_b_cidr" {
  description = "CIDR block for the private subnet of azb"
  default     = "10.10.16.0/24"
}

variable "region" {
  description = "Region for launching subnets"
  default     = "ap-southeast-1"
}



variable "public_route_table_name" {
  description = "route table"
  default     = "dwh_pub_prod_route"
}


variable "public_sub_name" {
  description = "Name of the public"
  default     = "dwh_pub_prod_sub_az"
}



variable "public_sub_a_cidr" {
  description = "CIDR block for the public subnet of aza"
  default     = "10.10.15.0/24"
}



variable "private_prod_route_table_name" {
  description = "route table"
  default     = "dwh_private_prod_db_route"
}




variable "private_bknd_sub_name" {
  description = "Name of the private subnet"
  default     = "dwh_private_prod_bknd_sub_az"
}


variable "private_bknd_sub_a_cidr" {
  description = "CIDR block for the private subnet of aza"
  default     = "10.10.13.0/24"
}

variable "private_bknd_sub_b_cidr" {
  description = "CIDR block for the private subnet of azb"
  default     = "10.10.12.0/24"
}



variable "public_sub_b_cidr" {
  description = "CIDR block for the private subnet of azb"
  default     = "10.10.11.0/24"
}




variable "private_web_sub_name" {
  description = "Name of the private subnet"
  default     = "dwh_private_prod_web_sub_az"
}



variable "private_web_sub_a_cidr" {
  description = "CIDR block for the private subnet of aza"
  default     = "10.10.10.0/24"
}

variable "private_web_sub_b_cidr" {
  description = "CIDR block for the private subnet of azb"
  default     = "10.10.9.0/24"
}
