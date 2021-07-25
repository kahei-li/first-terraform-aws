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
  region  = var.region
}

# VPC | Creating a VPC specifying cidr block and name tag
resource "aws_vpc" "main_vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = "poc-main-vpc"
    Environment = var.environment
  }
}

# IG | Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "main_gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "poc-main-gw"
    Environment = var.environment
  }
}

# MODULE | Instantiate child module app-tier
module "app" {
  source = "./modules/app"
  vpc_id = aws_vpc.main_vpc.id
  gateway_id = aws_internet_gateway.main_gw.id
  environment = var.environment
}

module "elb" {
  source = "./modules/elb"
  vpc_id = aws_vpc.main_vpc.id
  instances_ids = module.app.instances_ids
  subnets_ids = module.app.subnets_ids
  environment = var.environment
}