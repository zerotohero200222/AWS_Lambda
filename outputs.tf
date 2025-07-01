output "lambda_function_name" {
  value = aws_lambda_function.test_lambda.function_name
}

output "lambda_role_name" {
  value = aws_iam_role.iam_for_lambda.name
}
