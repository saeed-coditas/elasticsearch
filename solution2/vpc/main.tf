module "vpc" {
  source                             = "terraform-aws-modules/vpc/aws"
  version                            = "3.14.0"
  name                               = "${local.environment}-${var.product}-vpc"
  azs                                = local.env_conf.azs
  cidr                               = local.vpc_conf.vpc_cidr_block
  private_subnets                    = local.vpc_conf.private_subnets
  public_subnets                     = local.vpc_conf.public_subnets
  create_database_subnet_route_table = true
  database_dedicated_network_acl     = true
  create_database_subnet_group       = true
  enable_dns_hostnames               = true
  tags                               = local.tags
}