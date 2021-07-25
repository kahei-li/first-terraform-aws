variable "environment" {
description = "specify tagging for environment"
default = "Development"
}

variable "region" {
  description = "specify region"
  default = "eu-west-2"
}

variable "cidr_block" {
  description = "specify region"
  default = "20.1.0.0/16"
}
