variable "environment" {
  description = "Interpolating environment tag from root module"
}

variable "vpc_id" {
  description = "Interpolating vpc_id passed in via root module from vpc module"
}

variable "instance_1_id" {
    description = "Interpolating instances_1_id output via root module from app module"
}

variable "instance_2_id" {
    description = "Interpolating instances_2_id output via root module from app module"
}

variable "subnet_a_id" {
    description = "Interpolating subnets_a_id output via root module from vpc module"
}

variable "subnet_b_id" {
    description = "Interpolating subnets_b_id output via root module from vpc module"
}

variable "elb_sg_id" {
    description = "Interpolating elb_sg_id output via root module from sg module"
}