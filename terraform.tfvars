region = "ap-northeast-2"
name   = "acc-disaster"

vpc_cidr             = "10.0.0.0/16"
azs                  = ["ap-northeast-2a", "ap-northeast-2b"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]

alb_allowed_ingress_cidrs = ["0.0.0.0/0"]

health_check_path = "/health"

task_cpu      = 512
task_memory   = 1024
desired_count = 2

spring_backend_image      = "happine2s/acc-disaster:latest"
prometheus_exporter_image = "prom/prometheus"
