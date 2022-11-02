module "vpc" {
  source = "./modules/vpc"

  environment = var.environment
  region      = var.region
}

module "ec2" {
  source = "./modules/ec2"

  environment = var.environment
  region      = var.region
  pub_sub1_id = module.vpc.pub_sub1_id
  sg_id       = module.vpc.sg_id
  userdata    = "userdata.sh"

}
