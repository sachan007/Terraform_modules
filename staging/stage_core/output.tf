output "private_stag_sub_a_id" {
  description = "Ouput ID of the created Private Subnet AZA"
  value = "${module.private_stag_sub_a.id}"
}

#output "private_dev_sub_b_id" {
#  description = "Ouput ID of the created private Subnet AZB"
#  value = "${module.private_dev_sub_b.id}"
#}

output "pub_stag_sub_a_id" {
  description = "Ouput ID of the created Public Subnet AZA"
  value = "${module.pub_stag_sub_a.id}"
}
