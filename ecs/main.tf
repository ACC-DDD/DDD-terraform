resource "aws_ecs_service" "spring_service" {
  name            = "spring-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.spring_with_exporter.arn
  desired_count   = 2
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = var.private_subnet_ids
    assign_public_ip = false
    security_groups  = [var.security_group_id]
  }
  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "spring-backend"
    container_port   = 8080
  }
  depends_on = [aws_iam_role_policy_attachment.ecs_task_execution_policy]
}