variable "queue_name" {
  description = "Name of the SQS queue"
  type        = string
}

variable "sns_topic" {
  description = "ARN of the SNS topic to subscribe to"
  type        = string
}
