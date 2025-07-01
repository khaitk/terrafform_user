resource "aws_cloudwatch_metric_alarm" "lambda_errors" {
  alarm_name          = "${var.lambda_name}-errors"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = "60"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "This metric monitors lambda errors"
  treat_missing_data  = "notBreaching"
  
  dimensions = {
    FunctionName = var.lambda_name
  }
}

resource "aws_cloudwatch_metric_alarm" "api_gateway_5xx" {
  alarm_name          = "${var.api_gateway_id}-5xx-errors"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "5XXError"
  namespace           = "AWS/ApiGateway"
  period              = "60"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "This metric monitors API Gateway 5XX errors"
  treat_missing_data  = "notBreaching"
  
  dimensions = {
    ApiId = var.api_gateway_id
  }
}

resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "application-dashboard"
  
  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/Lambda", "Invocations", "FunctionName", var.lambda_name],
            ["AWS/Lambda", "Errors", "FunctionName", var.lambda_name],
            ["AWS/Lambda", "Duration", "FunctionName", var.lambda_name]
          ]
          period = 300
          stat   = "Sum"
          region = data.aws_region.current.id
          title  = "Lambda Metrics"
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/ApiGateway", "Count", "ApiId", var.api_gateway_id],
            ["AWS/ApiGateway", "4XXError", "ApiId", var.api_gateway_id],
            ["AWS/ApiGateway", "5XXError", "ApiId", var.api_gateway_id]
          ]
          period = 300
          stat   = "Sum"
          region = data.aws_region.current.id
          title  = "API Gateway Metrics"
        }
      }
    ]
  })
}

data "aws_region" "current" {}
