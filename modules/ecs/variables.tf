variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "cpu" {
  type = number
}

variable "memory" {
  type = number
}

variable "desired_count" {
  type = number
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "spring_backend_image" {
  type = string
}

variable "prometheus_exporter_image" {
  type = string
}

variable "container_port" {
  type = number
}

variable "prometheus_port" {
  type = number
}

variable "target_group_arn" {
  type = string
}

variable "alb_sg_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "spring_env" {
  type    = list(object({ name = string, value = string }))
  default = []
}