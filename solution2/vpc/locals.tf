locals {
  region      = var.regions[terraform.workspace]
  environment = terraform.workspace
  env_conf    = lookup(var.environment, local.environment)
  vpc_conf    = lookup(local.env_conf, "vpc_conf")
  tags = {
    Environment             = local.environment
    Product                 = var.product
    Use_case                = "vpc"
    Can_be_deleted          = true
    Created_using_terraform = true
  }
}