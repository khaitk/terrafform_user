variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "s3_bucket" {
  description = "S3 bucket containing Lambda deployment package"
  type        = string
}

variable "s3_key" {
  description = "S3 key for Lambda deployment package"
  type        = string
}

variable "handler" {
  description = "Lambda function handler"
  type        = string
}

variable "runtime" {
  description = "Lambda function runtime"
  type        = string
}

variable "timeout" {
  description = "Lambda function timeout in seconds"
  type        = number
  default     = 30
}

variable "memory_size" {
  description = "Lambda function memory size in MB"
  type        = number
  default     = 128
}

variable "role_arn" {
  description = "ARN of the IAM role for Lambda"
  type        = string
  default     = ""
}

variable "environment_vars" {
  description = "Environment variables for Lambda function"
  type        = map(string)
  default     = {}
}
