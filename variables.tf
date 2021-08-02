# root module variables requiring tfvar inputs
variable "environment" {
description = "specify tagging for environment"
}

variable "region" {
  description = "specify region"
}

# variable "access_key" {
#   description = "specify access key"
# }

# variable "secret_key" {
#   description = "specify secret key"
# }

# vpc module variables requiring tfvars input
variable "vpc_cidr_block" {
  description = "specify region"
}

variable "route_cidr_block" {
  description = "specify main route table route cidr block"
}

variable "subnet_a_cidr_block" {
  description = "specify cidr block for subent a"
}

variable "subnet_b_cidr_block" {
  description = "specify cidr block for subent b"
}

variable "subnet_a_az" {
  description = "specify availability zone for subnet a"
}

variable "subnet_b_az" {
  description = "specify availability zone for subnet b"
}

# sg module variables requiring tfvars input
variable "developer_vm_cidr" {
  description = "Specify developer vm ip in cidr block to apply whitelisting"
}

variable "elb_ingress_cidr_http" {
  description = "Specify elb ingress cidr for http port. Otherwise default for this is 0.0.0.0/0 i.e. publicly available via the internet"
  default = "0.0.0.0/0"
}

# elb module variables requiring tfvars input
# none

# app module variables reuiring tfvars input
variable "key_name" {
  description = "key-name for instance default key"
}

variable "public_key_path" {
 description = "key-path"
}

variable "app_instance_type" {
  description = "specify instance type to deploy"
}

variable "ami" {
  description = "specify an ami number to deploy"
}

#  api module variables requiring tfvars input
variable "api_instance_type" {
  description = "specify instance type to deploy"
}

#  db module variables requiring tfvars input
variable "db_instance_type" {
  description = "specify instance type to deploy"
}