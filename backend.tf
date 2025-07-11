terraform {
  backend "s3" {
    bucket = "terraform-state-bharath-lambda"
    key    = "lambda/dev/terraform.tfstate"
    region = "us-east-2"
  }
}
