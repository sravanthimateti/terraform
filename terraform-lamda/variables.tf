variable "region" {
  description = "The AWS region to deploy the Lambda function."
  type        = string
  default     = "us-east-1"
}

variable "lambda_function_name" {
  description = "The name of the Lambda function."
  type        = string
}

variable "lambda_handler" {
  description = "The handler for the Lambda function."
  type        = string
  default     = "index.handler"
}

variable "lambda_runtime" {
  description = "The runtime environment for the Lambda function."
  type        = string
  default     = "nodejs14.x"
}

variable "lambda_package" {
  description = "Path to the Lambda deployment package (ZIP file)."
  type        = string
}

variable "lambda_env_vars" {
  description = "Environment variables for the Lambda function."
  type        = map(string)
}

variable "log_retention" {
  description = "Retention period for Lambda CloudWatch logs (in days)."
  type        = number
  default     = 14
}
