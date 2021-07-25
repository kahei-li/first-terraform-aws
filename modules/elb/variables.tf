variable "environment" {
  description = "Interpolating environment tag from root module"
}

variable "vpc_id" {
  description = "Interpolating vpc_id passed in from root module"
}

variable "instances_ids" {
    description = "Interpolating instances_ids output from app module from root module"
}

variable "subnets_ids" {
    description = "Interpolating subnets_ids output from app module from root module"
}