variable "lambda_function_name_prefix" {
  type        = string
  default     = "lambda"
  description = "Prefix for the Lambda function name"
}

variable "aws_region" {
  type        = string
  default     = "us-east-2"
  description = "AWS region"
}
