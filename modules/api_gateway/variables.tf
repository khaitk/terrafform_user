variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "lambda_function" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_invoke_arn" {
  description = "Invoke ARN of the Lambda function"
  type        = string
}
