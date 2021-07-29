terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

# PROVIDER | Specifying cloud provider and region for terraform activities
provider "aws" {
  profile = "default"
  # access_key = var.access_key
  # secret_key = var.secret_key
  region  = var.region
}

# MODULES | Instantiate modules
module "vpc" {
  source = "./modules/vpc"
  # passing in default variable or from tfvars
  environment = var.environment
  vpc_cidr_block = var.vpc_cidr_block
  route_cidr_block = var.route_cidr_block
  subnet_a_cidr_block = var.subnet_a_cidr_block
  subnet_b_cidr_block = var.subnet_b_cidr_block
  subnet_a_az = var.subnet_a_az
  subnet_b_az = var.subnet_b_az
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
  vpc_cidr_block = module.vpc.vpc_cidr_block
  # passing in default variable or from tfvars
  environment = var.environment
  developer_vm_cidr = var.developer_vm_cidr
  elb_ingress_cidr_http = var.elb_ingress_cidr_http
}

module "elb" {
  source = "./modules/elb"
  vpc_id = module.vpc.vpc_id
  instance_1_id = module.app.instance_1_id
  instance_2_id = module.app.instance_2_id
  subnet_a_id = module.vpc.subnet_a_id
  subnet_b_id = module.vpc.subnet_b_id
  elb_sg_id = module.sg.elb_sg_id
  # passing in default variable or from tfvars
  environment = var.environment
}

module "app" {
  source = "./modules/app"
  vpc_id = module.vpc.vpc_id
  developer_sg_id = module.sg.developer_sg_id
  vpc_internal_sg_id = module.sg.vpc_internal_sg_id
  subnet_a_id = module.vpc.subnet_a_id
  subnet_b_id = module.vpc.subnet_b_id
  # passing in default variable or from tfvars
  environment = var.environment
  key_name = var.key_name
  public_key_path = var.public_key_path
  instance_type = var.instance_type
  ami = var.ami
  app_lb_target_group_http_arn = module.elb.app_lb_target_group_http_arn
}
