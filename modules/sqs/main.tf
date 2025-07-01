resource "aws_sqs_queue" "queue" {
  name                      = var.queue_name
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600  # 4 days
  receive_wait_time_seconds = 10
  visibility_timeout_seconds = 30

  tags = {
    Environment = "dev"
  }
}

resource "aws_sqs_queue_policy" "queue_policy" {
  queue_url = aws_sqs_queue.queue.id

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "sqspolicy"
    Statement = [
      {
        Sid       = "First"
        Effect    = "Allow"
        Principal = "*"
        Action    = "sqs:SendMessage"
        Resource  = aws_sqs_queue.queue.arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = var.sns_topic
          }
        }
      }
    ]
  })
}

resource "aws_sns_topic_subscription" "sns_to_sqs" {
  topic_arn = var.sns_topic
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.queue.arn
}
