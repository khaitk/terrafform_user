output "api_id" {
  description = "ID of the API Gateway"
  value       = aws_apigatewayv2_api.api.id
}

output "api_arn" {
  description = "ARN of the API Gateway"
  value       = aws_apigatewayv2_api.api.arn
}

output "invoke_url" {
  description = "Invoke URL of the API Gateway"
  value       = aws_apigatewayv2_stage.default.invoke_url
}
