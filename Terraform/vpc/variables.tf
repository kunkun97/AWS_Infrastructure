variable "region" {}

variable "vpc_cidr" {}

variable "public_subnet_cidr" {}

variable "availability_zone" {}

variable "public_subnet_cidr_2" {}

variable "availability_zone_2" {}

variable "enabled" {
  type = bool
  default = true
}