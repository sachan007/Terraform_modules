variable "vpc_cidr" {
    description = "CIDR of the VPC"
    default     = "172.21.113.0/24"
}

variable "vpc_name" {
    description = "CIDR of the VPC"
    default     = "PROD-ML"
}

variable "region" {
  description = "Region for launching subnets"
  default     = "ap-southeast-1"
}

#variable "pub_sub_a_cidr" {
#  description = "CIDR block for the public subnet of aza"
#  default     = "10.10.0.0/20"
#}

variable "enable_dns_hostnames" {
  description = "Whether to enable hostname communication or not"
  default     = "true"
}

variable "enable_dns_support" {
  description = "Whether to enable dns support or not for Route53"
  default     = "true"
}

variable "route53_zone_name" {
  description = "Route53 record zone name"
  default     = "internal.prod-ml.com"
}


variable "aws_profile" {
  description = "Route53 record zone name"
  default     = "test"
}


