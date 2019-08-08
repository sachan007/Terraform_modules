terraform {
  backend "s3" {
    profile = "test"
    bucket = "terraform-backend-daas"
    key    = "development/dev_core"
    region = "ap-south-1"
  }
}
