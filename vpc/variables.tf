variable "region" { default = "ap-northeast-2" }
variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "public_subnet_a_cidr" { default = "10.0.1.0/24" }
variable "public_subnet_b_cidr" { default = "10.0.2.0/24" }
variable "private_subnet_a_cidr" { default = "10.0.10.0/25" }
variable "private_subnet_b_cidr" { default = "10.0.11.0/25" }