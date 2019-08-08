
output "id" {
  value = "${aws_vpc.vpc.id}"
}

output "internet_gateway_id" {
  value = "${aws_internet_gateway.igw.id}"
}


output "zone_id" {
  value = "${aws_route53_zone.route53_zone.zone_id}"
}

