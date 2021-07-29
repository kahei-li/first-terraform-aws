variable "environment" {
  description = "Interpolating environment tag from root module"
}

variable "vpc_id" {
  description = "Interpolating vpc_id passed in from root module"
}

variable "vpc_cidr_block" {
  description = "Interpolating vpc_cidr_block passed in from root module"
}

variable "developer_vm_cidr" {
  description = "Interpolating developer vm cidr from root module"
}

variable "elb_ingress_cidr_http" {
  description = "Interpolating elb ingress cidr http passed in from root module."
}