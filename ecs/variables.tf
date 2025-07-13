variable "spring_backend_image" {}
variable "exporter_image" { default = "prom/prometheus" }
variable "target_group_arn" {}
variable "security_group_id" {}
variable "private_subnet_ids" { type = list(string) }