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
module "apigw" {
  source       = "./modules/apigw"
  name         = var.name
  alb_dns_name = module.alb.alb_dns_name
}

module "s3" {
  source                   = "./modules/s3"
  s3_bucket_name           = var.s3_bucket_name
  cloudfront_distribution_arn = module.cloudfront.cloudfront_distribution_arn
}

module "cloudfront" {
  source                         = "./modules/cloudfront"
  s3_bucket_name                 = module.s3.bucket_name
  s3_bucket_arn                  = module.s3.bucket_arn
  s3_bucket_regional_domain_name = module.s3.bucket_regional_domain_name
  # api_gateway_endpoint       = module.apigw.api_gateway_endpoint
  api_gateway_endpoint = replace(module.apigw.api_gateway_endpoint, "https://", "")

}