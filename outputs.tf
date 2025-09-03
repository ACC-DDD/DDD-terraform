output "alb_dns_name" {
  value = module.alb.alb_dns_name
}


output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}


output "service_name" {
  value = module.ecs.service_name
}

output "api_gateway_endpoint" {
  value = module.apigateway.api_endpoint
}

output "cloudfront_domain" {
  value = module.cloudfront.domain_name
}
