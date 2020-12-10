variable "AWS_REGION" { default = "ap-south-1"}

module "main-vpc" {
  source = "../Modules/vpc"
  ENV    = "${var.AWS_REGION}"
}

module "instance" {
  source         = "../Modules/instance"
  ENV            = "dev"
  VPC_ID         = module.main-vpc.vpc_id
  PUBLIC_SUBNETS = module.main-vpc.public_subnets  
}
