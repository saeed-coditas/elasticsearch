data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-elastic"
    key    = "vpc.tfstate"
    region = "us-west-2"
    profile = "myacc"
  }
  workspace = local.environment
}