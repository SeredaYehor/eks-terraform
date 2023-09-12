variable "vpc_cidr" {
  default = "142.64.0.0/22"
}

variable "public_first_cidr" {
  default = "142.64.0.0/24"
}

variable "public_second_cidr" {
  default = "142.64.1.0/24"
}

variable "private_first_cidr" {
  default = "142.64.2.0/24"
}

variable "private_second_cidr" {
  default = "142.64.3.0/24"
}

variable "environment" {
}

variable "region" {
}

