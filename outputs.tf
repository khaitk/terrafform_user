output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.s3.bucket_name
}

output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = module.lambda.function_name
}

output "lambda_function_url" {
  description = "Direct URL of the Lambda function"
  value       = module.lambda.function_url
}

output "api_gateway_url" {
  description = "URL of the API Gateway"
  value       = module.api_gateway.invoke_url
}

output "api_endpoints" {
  description = "API Endpoints"
  value = {
    root   = "${module.api_gateway.invoke_url}/"
    items  = "${module.api_gateway.invoke_url}/items"
    status = "${module.api_gateway.invoke_url}/status"
  }
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic"
  value       = module.sns.topic_arn
}

output "sqs_queue_url" {
  description = "URL of the SQS queue"
  value       = module.sqs.queue_url
}

output "cloudwatch_log_group" {
  description = "CloudWatch Log Group for Lambda"
  value       = "/aws/lambda/${module.lambda.function_name}"
}
