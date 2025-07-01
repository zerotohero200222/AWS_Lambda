provider "aws" {
  region = var.aws_region
}

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

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda.js"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "test_lambda" {
  function_name = "${var.lambda_function_name_prefix}-${random_string.suffix.result}"
  filename      = "lambda_function_payload.zip"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.test"
  runtime       = "nodejs18.x"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  environment {
    variables = {
      foo = "bar"
    }
  }
}
