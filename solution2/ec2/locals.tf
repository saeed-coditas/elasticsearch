locals {
  region        = var.regions[terraform.workspace]
  environment   = terraform.workspace
  env_conf      = lookup(var.environment, local.environment)
  instance_conf = lookup(local.env_conf, "instance_conf")
  tags = {
    Environment             = local.environment
    Product                 = var.product
    Use_case                = "elasticsearch-instance"
    Can_be_deleted          = true
    Created_using_terraform = true
  }
  storage_bucket_name = "terraform-elastic"
  key_name = "env:/${local.environment}/ssh-keys/${local.environment}-${var.product}-keypair.pem"
}