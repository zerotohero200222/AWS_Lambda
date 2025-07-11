# Generate a random string to make the Lambda function name unique
resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

# IAM Assume Role Policy Document for Lambda
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

# IAM Role for Lambda Execution
resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# Package the Lambda function into a ZIP file
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda.js"
  output_path = "lambda_function_payload.zip"
}

# Lambda Function Resource
resource "aws_lambda_function" "test_lambda" {
  function_name = "${var.lambda_function_name_prefix}-${random_string.suffix.result}"
  filename      = data.archive_file.lambda.output_path
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.test"
  runtime       = "nodejs18.x"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  environment {
    variables = {
      foo = "bar"
    }
  }

  tags = {
    Environment = "dev"
    Project     = "LambdaDeployment"
  }
}
