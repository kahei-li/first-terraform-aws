variable "environment" {
  description = "Interpolating environment tag from root module"
}

variable "vpc_id" {
  description = "Interpolating vpc_id passed in via root module from vpc module"
}

variable "key_name" {
  description = "Interpolating key-name from root module"
}

variable "api_instance_type" {
  description = "Interpolating instance type from root module"
}

variable "ami" {
  description = "Interpolating ami from root module"
}

variable "developer_sg_id" {
  description = "Interpolating developer_sg_id passed in via root module from sg module"
}

variable "vpc_internal_sg_id" {
  description = "Interpolating vpc_internal_sg_id passed in via root module from sg module"
}

variable "subnet_a_id" {
  description = "Interpolating subnet_a_id passed in via root module from vpc module"
}

variable "subnet_b_id" {
  description = "Interpolating subnet_b_id passed in via root module from vpc module"
}

# variable "app_lb_target_group_http_arn" {
#   description = "Interpolating app lb target group arn passed in via root module from elb module"
# }
