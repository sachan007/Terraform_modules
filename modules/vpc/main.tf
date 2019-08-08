resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"

  tags {
    Name = "${var.name}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.name}-igw"
  }
}

resource "aws_route53_zone" "route53_zone" {
  name   = "${var.route53_zone_name}"
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.route53_zone_name}"
  }
}
