terraform {
  backend "s3" {
    profile = "test"
    bucket = "terraform-backend-daas"
    key    = "production/prod_infra"
    region = "ap-south-1"
  }
}
