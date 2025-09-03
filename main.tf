terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.40"
    }
  }
}


provider "aws" {
  region = var.region
}


# VPC
module "vpc" {
  source = "./modules/vpc"


  name                 = var.name
  cidr_block           = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_nat_gateway   = true
}


# ALB 
module "alb" {
  source = "./modules/alb"


  name                  = var.name
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  allowed_ingress_cidrs = var.alb_allowed_ingress_cidrs
  health_check_path     = var.health_check_path
  target_port           = 8080
}


# ECS (Fargate) 
module "ecs" {
  source = "./modules/ecs"


  name                      = var.name
  cluster_name              = "${var.name}-cluster"
  cpu                       = var.task_cpu
  memory                    = var.task_memory
  desired_count             = var.desired_count
  vpc_id                    = module.vpc.vpc_id
  private_subnet_ids        = module.vpc.private_subnet_ids
  spring_backend_image      = var.spring_backend_image
  prometheus_exporter_image = var.prometheus_exporter_image
  container_port            = 8080
  prometheus_port           = 9090
  target_group_arn          = module.alb.target_group_arn
  alb_sg_id                 = module.alb.alb_sg_id
  vpc_cidr                  = var.vpc_cidr
}

# APIGW
module "apigateway" {
  source       = "./modules/apigateway"
  name         = var.name
  alb_dns_name = module.alb.this_dns_name
}

module "cloudfront" {
  source  = "terraform-aws-modules/cloudfront/aws//examples/complete"
  version = "5.0.0"

  enabled = true

  origins = [
    {
      domain_name = module.apigateway.api_endpoint
      origin_id   = "api-gateway-origin"
      custom_origin_config = {
        origin_protocol_policy = "https-only"
      }
    }
  ]

  default_cache_behavior = {
    target_origin_id       = "api-gateway-origin"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods         = ["GET", "HEAD"]
    compress               = true
  }

  viewer_certificate = {
    cloudfront_default_certificate = true
  }
}

