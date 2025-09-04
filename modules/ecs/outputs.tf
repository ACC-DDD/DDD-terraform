output "cluster_name" { value = aws_ecs_cluster.this.name }

output "spring_backend_service_name" {
  value = aws_ecs_service.spring_backend.name
}

output "prometheus_exporter_service_name" {
  value = aws_ecs_service.prometheus_exporter.name
}
