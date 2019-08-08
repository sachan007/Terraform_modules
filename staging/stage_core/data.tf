data "terraform_remote_state" "core" {
  backend = "s3"

  config {
    profile = "test"
    bucket = "terraform-backend-daas"
    key    = "core/core_state"
    region = "ap-south-1"
  }
}
