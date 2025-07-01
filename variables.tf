variable "lambda_function_name" {
  type    = string
  default = "lambda-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  upper   = false
  special = false
}
