# The log group is now managed in the Lambda module
# output "log_group_name" {
#   description = "Name of the CloudWatch Log Group for Lambda"
#   value       = aws_cloudwatch_log_group.lambda_log_group.name
# }

output "dashboard_name" {
  description = "Name of the CloudWatch Dashboard"
  value       = aws_cloudwatch_dashboard.main.dashboard_name
}
