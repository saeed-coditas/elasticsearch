regions = {
  dev = "us-west-2"
}
environment = {
  dev = {
    region = "us-west-2"
    azs = [
      "us-west-2a",
      "us-west-2b"
    ]
    vpc_conf = {
      vpc_cidr_block  = "10.40.0.0/16"
      public_subnets  = ["10.40.1.0/24", "10.40.2.0/24"]
      private_subnets = ["10.40.101.0/24", "10.40.201.0/24"]
    }
  }
}