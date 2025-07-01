provider "aws" {
  region = var.aws_region
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "lambda" {
  source             = "./modules/lambda"
  function_name      = var.lambda_function_name
  s3_bucket          = module.s3.bucket_name
  s3_key             = var.lambda_s3_key
  handler            = var.lambda_handler
  runtime            = var.lambda_runtime
  timeout            = var.lambda_timeout
  memory_size        = var.lambda_memory_size
  role_arn           = module.lambda.lambda_role_arn
  environment_vars   = var.lambda_environment_vars
}

module "api_gateway" {
  source            = "./modules/api_gateway"
  api_name          = var.api_name
  lambda_function   = module.lambda.function_name
  lambda_invoke_arn = module.lambda.invoke_arn
}

module "sns" {
  source     = "./modules/sns"
  topic_name = var.sns_topic_name
}

module "sqs" {
  source      = "./modules/sqs"
  queue_name  = var.sqs_queue_name
  sns_topic   = module.sns.topic_arn
}

module "cloudwatch" {
  source         = "./modules/cloudwatch"
  lambda_name    = module.lambda.function_name
  api_gateway_id = module.api_gateway.api_id
}
