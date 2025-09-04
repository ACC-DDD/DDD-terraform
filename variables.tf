variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-2"
}

variable "name" {
  description = "Base name/prefix"
  type        = string
  default     = "disaster"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["ap-northeast-2a", "ap-northeast-2b"]
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "alb_allowed_ingress_cidrs" {
  description = "CIDRs allowed to access ALB (80/443)"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# variable "use_https" {
#   type    = bool
#   default = false
# }

variable "health_check_path" {
  type    = string
  default = "/health"
}

variable "task_cpu" {
  type    = number
  default = 512
}

variable "task_memory" {
  type    = number
  default = 1024
}

variable "desired_count" {
  type    = number
  default = 1
}

variable "spring_backend_image" {
  type    = string
  default = "happine2s/acc-disaster:latest"
}

variable "prometheus_exporter_image" {
  type    = string
  default = "prom/prometheus:latest"
}

# variable "create_ecr" {
#   description = "Whether to create ECR repositories"
#   type        = bool
#   default     = false
# }

# variable "ecr_repositories" {
#   description = "List of ECR repository names to create when create_ecr=true"
#   type        = list(string)
#   default     = ["spring-backend", "prometheus-exporter"]
# }

# variable "cloudfront_enabled" {
#   type    = bool
#   default = true
# }

# variable "cloudfront_default_certificate" {
#   type    = bool
#   default = true
# }