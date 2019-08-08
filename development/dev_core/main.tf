
provider "aws" {
  region     = "${var.region}"
  profile    = "${var.aws_profile}" #.aws/credentials
}

module "private_dev_sub_a" {
    source                  = "../../modules/subnet"
    vpc_id                  = "${data.terraform_remote_state.core.vpcid}"
    cidr                    = "${var.private_sub_a_cidr}"
    az                      = "${var.region}a"
    name                    = "${var.private_sub_name}-a"
    map_public_ip_on_launch = "false"
}


module "private_dev_sub_b" {
    source                  = "../../modules/subnet"
    vpc_id                  = "${data.terraform_remote_state.core.vpcid}"
    cidr                    = "${var.private_sub_b_cidr}"
    az                      = "${var.region}b"
    name                    = "${var.private_sub_name}-b"
    map_public_ip_on_launch = "false"
}





module "pub_dev_sub_a" {
    source                  = "../../modules/subnet"
    vpc_id                  = "${data.terraform_remote_state.core.vpcid}"
    cidr                    = "${var.public_sub_a_cidr}"
    az                      = "${var.region}a"
   name                    = "${var.public_sub_name}-a"
    map_public_ip_on_launch = "false"
}




module "pub_dev_route_table" {
  source                   = "../../modules/route_table"
  vpc_id                   = "${data.terraform_remote_state.core.vpcid}"
  gateway_id               = "${data.terraform_remote_state.core.internet_gateway_id}"
  route_table_name         = "${var.public_route_table_name}"
}

module "pub_sn_a_association" {
  source           = "../../modules/subnet_association"
  subnet_id        = "${module.pub_dev_sub_a.id}"
  route_table_id   = "${module.pub_dev_route_table.route_table_id}"
}

module "dev_nat_gateway" {
  source                  = "../../modules/nat_gateway"
  subnet_id               = "${module.pub_dev_sub_a.id}"
}

module "private_dev_route_table" {
  source                   = "../../modules/route_table"
  vpc_id                   = "${data.terraform_remote_state.core.vpcid}"
  gateway_id               = "${module.dev_nat_gateway.nat_gateway_id}"
  route_table_name         = "${var.private_dev_route_table_name}"
}

module "private_dev_sub_a_association" {
  source           = "../../modules/subnet_association"
  subnet_id        = "${module.private_dev_sub_a.id}"
  route_table_id   = "${module.private_dev_route_table.route_table_id}"
}


module "private_dev_sub_b_association" {
  source           = "../../modules/subnet_association"
  subnet_id        = "${module.private_dev_sub_b.id}"
  route_table_id   = "${module.private_dev_route_table.route_table_id}"
}


