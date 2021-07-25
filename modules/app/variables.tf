variable "environment" {
  description = "Interpolating environment tag from root module"
}

variable "vpc_id" {
  description = "Interpolating vpc_id passed in from root module"
}

variable "gateway_id" {
  description = "Interpolating gateway_id passed in from root module"
}

variable "route_cidr_block" {
  description = "specify main route table route cidr block"
  default = "0.0.0.0/0"
}

variable "subnet_a_cidr_block" {
  description = "specify cidr block for subent a"
  default = "20.1.0.0/24"
}

variable "subnet_b_cidr_block" {
  description = "specify cidr block for subent b"
  default = "20.1.1.0/24"
}

variable "subnet_a_az" {
  description = "specify availability zone for subnet a"
  default = "eu-west-2a"
}

variable "subnet_b_az" {
  description = "specify availability zone for subnet b"
  default = "eu-west-2b"
}

variable "key_name" {
  description = "key-name"
  default = "poc_user"
}

variable "public_key_path" {
 description = "key-path"
 default = "specify-poc-user-key-path"
}

variable "instance_type" {
  description = "specify instance type to deploy"
  default = "t2.micro"
}

variable "ami" {
  description = "specify an ami number to deploy"
  default = "ami-014ec3973fd627c70"
}