terraform {
  backend "s3" {
    profile = "test"
    bucket = "terraform-backend-daas"
    key    = "core/core_state"
    region = "ap-south-1"
  }
}
