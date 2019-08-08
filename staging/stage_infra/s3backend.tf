terraform {
  backend "s3" {
    profile = "test"
    bucket = "terraform-backend-daas"
    key    = "staging/stage_infra"
    region = "ap-south-1"
  }
}
