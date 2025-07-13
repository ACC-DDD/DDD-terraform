resource "aws_ecs_task_definition" "spring_with_exporter" {
  family                   = "spring-prometheus-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([
    {
      name         = "spring-backend",
      image        = var.spring_backend_image,
      portMappings = [{ containerPort = 8080 }]
    },
    {
      name         = "prometheus-exporter",
      image        = var.exporter_image,
      portMappings = [{ containerPort = 9100 }]
    }
  ])
}