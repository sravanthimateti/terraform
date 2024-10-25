output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.my_lambda.arn
}

output "lambda_cloudwatch_log_group" {
  description = "The name of the CloudWatch log group for Lambda"
  value       = aws_cloudwatch_log_group.lambda_log_group.name
}
