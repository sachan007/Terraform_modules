provider "aws" {
  region     = "${var.region}"
  profile    = "${var.aws_profile}" #.aws/credentials
#  profile    = "default-long-long-term"
}


module "vpc" {
    source               = "../modules/vpc"
    cidr                 = "${var.vpc_cidr}"
    name                 = "${var.vpc_name}"
    route53_zone_name    = "${var.route53_zone_name}"
    enable_dns_hostnames = "${var.enable_dns_hostnames}"
    enable_dns_support   = "${var.enable_dns_support}"
}

