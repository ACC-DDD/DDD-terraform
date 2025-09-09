output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}

output "spring_backend_service_name" {
  value = module.ecs.spring_backend_service_name
}

output "prometheus_exporter_service_name" {
  value = module.ecs.prometheus_exporter_service_name
}

output "api_gateway_endpoint" {
  value = module.apigw.api_gateway_endpoint
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "s3_bucket_arn" {
  description = "Frontend S3 bucket ARN"
  value       = module.s3.bucket_arn
}

output "cloudfront_domain_name" {
  value = module.cloudfront.cloudfront_domain_name
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  value       = module.cloudfront.cloudfront_distribution_id
}
