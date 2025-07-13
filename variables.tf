variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "lambda_function_name_prefix" {
  description = "Prefix for Lambda function name"
  type        = string
}

variable "lambda_handler" {
  description = "Lambda handler"
  type        = string
}

variable "lambda_runtime" {
  description = "Lambda runtime"
  type        = string
}

variable "lambda_source_file" {
  description = "Lambda source JS file"
  type        = string
}

variable "lambda_output_path" {
  description = "Path to output Lambda ZIP"
  type        = string
}
