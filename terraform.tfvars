aws_region          = "us-east-1"
bucket_name         = "jins12047"
lambda_function_name = "user-lambda"
lambda_s3_key       = "lambda_function.zip"
lambda_handler      = "index.handler"
lambda_runtime      = "nodejs18.x"
lambda_timeout      = 30
lambda_memory_size  = 128
lambda_environment_vars = {
  ENVIRONMENT = "dev"
}
api_name            = "user-api"
sns_topic_name      = "user-topic"
sqs_queue_name      = "user-queue"
