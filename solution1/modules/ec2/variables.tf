variable "ubuntu_ami" {
    default = "ami-000340e2c761dddcd"
}

variable "instance_type" {
    default = "t3.large"
}

variable "pub_sub1_id" {}

variable "sg_id" {}

variable "userdata" { }

variable "environment" {}

variable "region" {}

variable "storage_bucket_name" {
    default = "terraform-elastic"
}