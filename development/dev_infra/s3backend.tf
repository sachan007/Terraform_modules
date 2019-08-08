terraform {
  backend "s3" {
    profile = "test"
    bucket = "terraform-backend-daas"
    key    = "development/dev_infra"
    region = "ap-south-1"
  }
}
