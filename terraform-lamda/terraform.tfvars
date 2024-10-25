region               = "us-east-1"
lambda_function_name = "my_lambda_function"
lambda_handler       = "index.handler"
lambda_runtime       = "nodejs18.x"
lambda_package       = "lambda_function.zip"
lambda_env_vars = {
  ENV_VAR_1 = "value1"
  ENV_VAR_2 = "value2"
}
log_retention = 7
