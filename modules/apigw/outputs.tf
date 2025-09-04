output "api_endpoint" {
  value = aws_apigatewayv2_api.this.api_endpoint
}

output "api_gateway_endpoint" {
  value = aws_apigatewayv2_stage.default.invoke_url
}