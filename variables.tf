variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "user-app-bucket"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "user-lambda"
}

variable "lambda_s3_key" {
  description = "S3 key for Lambda deployment package"
  type        = string
  default     = "lambda_function.zip"
}

variable "lambda_handler" {
  description = "Lambda function handler"
  type        = string
  default     = "index.handler"
}

variable "lambda_runtime" {
  description = "Lambda function runtime"
  type        = string
  default     = "nodejs18.x"
}

variable "lambda_timeout" {
  description = "Lambda function timeout in seconds"
  type        = number
  default     = 30
}

variable "lambda_memory_size" {
  description = "Lambda function memory size in MB"
  type        = number
  default     = 128
}

variable "lambda_environment_vars" {
  description = "Environment variables for Lambda function"
  type        = map(string)
  default     = {
    ENVIRONMENT = "dev"
  }
}

variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
  default     = "user-api"
}

variable "sns_topic_name" {
  description = "Name of the SNS topic"
  type        = string
  default     = "user-topic"
}

variable "sqs_queue_name" {
  description = "Name of the SQS queue"
  type        = string
  default     = "user-queue"
}
