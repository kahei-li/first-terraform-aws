variable "environment" {
  description = "Interpolating environment tag from root module"
}

variable "vpc_cidr_block" {
  description = "Interpolating vpc_cidr_block from root module"
}

variable "route_cidr_block" {
  description = "Interpolating route_cidr_block from root module"
}

variable "subnet_a_cidr_block" {
  description = "Interpolating subnet_a_cidr_block from root module"
}

variable "subnet_b_cidr_block" {
  description = "Interpolating subnet_b_cidr_block from root module"
}

variable "subnet_a_az" {
  description = "Interpolating availability zone a from root module"
}

variable "subnet_b_az" {
  description = "Interpolating availability zone b from root module"
}
