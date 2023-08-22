variable "region" {}

variable "ami" {}

variable "instance_type" {}

variable "key_name" {}

variable "vpc_id" {}

variable "public_subnet_id" {}

variable "public_subnet_2_id" {}

variable "enabled" {
  type = bool
  default = true
}
