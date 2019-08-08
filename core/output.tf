output "vpcid" {
  description = "Ouput ID of the created VPC"
  value = "${module.vpc.id}"
}

output "internet_gateway_id" {
  description = "Ouput ID of the created VPC"
  value = "${module.vpc.internet_gateway_id}"
}
