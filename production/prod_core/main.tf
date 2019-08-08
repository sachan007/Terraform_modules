
provider "aws" {
  region     = "${var.region}"
  profile    = "${var.aws_profile}" #.aws/credentials
}
########## private subnet for db ####################
module "private_prod_db_sub_a" {
    source                  = "../../modules/subnet"
    vpc_id                  = "${data.terraform_remote_state.core.vpcid}"
    cidr                    = "${var.private_db_sub_a_cidr}"
    az                      = "${var.region}a"
    name                    = "${var.private_db_sub_name}-a"
    map_public_ip_on_launch = "false"
}


module "private_prod_db_sub_b" {
    source                  = "../../modules/subnet"
    vpc_id                  = "${data.terraform_remote_state.core.vpcid}"
    cidr                    = "${var.private_db_sub_b_cidr}"
    az                      = "${var.region}b"
    name                    = "${var.private_db_sub_name}-b"
    map_public_ip_on_launch = "false"
}
############private subnet for beckend #####################
module "private_prod_bknd_sub_a" {
    source                  = "../../modules/subnet"
    vpc_id                  = "${data.terraform_remote_state.core.vpcid}"
    cidr                    = "${var.private_bknd_sub_a_cidr}"
    az                      = "${var.region}a"
    name                    = "${var.private_bknd_sub_name}-a"
    map_public_ip_on_launch = "false"
}

module "private_prod_bknd_sub_b" {
    source                  = "../../modules/subnet"
    vpc_id                  = "${data.terraform_remote_state.core.vpcid}"
    cidr                    = "${var.private_bknd_sub_b_cidr}"
    az                      = "${var.region}b"
    name                    = "${var.private_bknd_sub_name}-b"
    map_public_ip_on_launch = "false"
}

################private subanet for web#########################
module "private_prod_web_sub_a" {
    source                  = "../../modules/subnet"
    vpc_id                  = "${data.terraform_remote_state.core.vpcid}"
    cidr                    = "${var.private_web_sub_a_cidr}"
    az                      = "${var.region}a"
    name                    = "${var.private_web_sub_name}-a"
    map_public_ip_on_launch = "false"
}

module "private_prod_web_sub_b" {
    source                  = "../../modules/subnet"
    vpc_id                  = "${data.terraform_remote_state.core.vpcid}"
    cidr                    = "${var.private_web_sub_b_cidr}"
    az                      = "${var.region}b"
    name                    = "${var.private_web_sub_name}-b"
    map_public_ip_on_launch = "false"
}







###### public subnet  ###############
module "pub_prod_sub_a" {
    source                  = "../../modules/subnet"
    vpc_id                  = "${data.terraform_remote_state.core.vpcid}"
    cidr                    = "${var.public_sub_a_cidr}"
    az                      = "${var.region}a"
   name                    = "${var.public_sub_name}-a"
    map_public_ip_on_launch = "false"
}


module "pub_prod_sub_b" {
    source                  = "../../modules/subnet"
    vpc_id                  = "${data.terraform_remote_state.core.vpcid}"
    cidr                    = "${var.public_sub_b_cidr}"
    az                      = "${var.region}b"
   name                    = "${var.public_sub_name}-b"
    map_public_ip_on_launch = "false"
}


#############creating route table for prod #################
module "pub_prod_route_table" {
  source                   = "../../modules/route_table"
  vpc_id                   = "${data.terraform_remote_state.core.vpcid}"
  gateway_id               = "${data.terraform_remote_state.core.internet_gateway_id}"
  route_table_name         = "${var.public_route_table_name}"
}

##############pub subet association to the route table ##############

module "pub_sn_a_association" {
  source           = "../../modules/subnet_association"
  subnet_id        = "${module.pub_prod_sub_a.id}"
  route_table_id   = "${module.pub_prod_route_table.route_table_id}"
}



module "pub_sn_b_association" {
  source           = "../../modules/subnet_association"
  subnet_id        = "${module.pub_prod_sub_b.id}"
  route_table_id   = "${module.pub_prod_route_table.route_table_id}"
}

############# creating nat ##################################

module "prod_nat_gateway" {
  source                  = "../../modules/nat_gateway"
  subnet_id               = "${module.pub_prod_sub_a.id}"
}

###############creating route table for private #####################

module "private_prod_route_table" {
  source                   = "../../modules/route_table"
  vpc_id                   = "${data.terraform_remote_state.core.vpcid}"
  gateway_id               = "${module.prod_nat_gateway.nat_gateway_id}"
  route_table_name         = "${var.private_prod_route_table_name}"
}
##############associating  db subnet-a to private route table #######################
module "private_prod_db_sub_a_association" {
  source           = "../../modules/subnet_association"
  subnet_id        = "${module.private_prod_db_sub_a.id}"
  route_table_id   = "${module.private_prod_route_table.route_table_id}"
}

module "private_prod_db_sub_b_association" {
  source           = "../../modules/subnet_association"
  subnet_id        = "${module.private_prod_db_sub_b.id}"
  route_table_id   = "${module.private_prod_route_table.route_table_id}"
}





#################associating beckend subnet to private route table ###################


module "private_prod_bknd_sub_a_association" {
  source           = "../../modules/subnet_association"
  subnet_id        = "${module.private_prod_bknd_sub_a.id}"
  route_table_id   = "${module.private_prod_route_table.route_table_id}"
}

module "private_prod_bknd_sub_b_association" {
  source           = "../../modules/subnet_association"
  subnet_id        = "${module.private_prod_bknd_sub_b.id}"
  route_table_id   = "${module.private_prod_route_table.route_table_id}"
}




##################associating web subnet to private route table ###########################
module "private_prod_web_sub_a_association" {
  source           = "../../modules/subnet_association"
  subnet_id        = "${module.private_prod_web_sub_a.id}"
  route_table_id   = "${module.private_prod_route_table.route_table_id}"
}

module "private_prod_web_sub_b_association" {
  source           = "../../modules/subnet_association"
  subnet_id        = "${module.private_prod_web_sub_b.id}"
  route_table_id   = "${module.private_prod_route_table.route_table_id}"
}
















