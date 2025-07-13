
# 🚀 Terraform Lambda Deployment with GitHub Actions

## 📖 Overview

This project demonstrates how to provision and deploy an AWS Lambda function using Terraform, with infrastructure as code managed in a modular and reusable format. The entire deployment process is automated via GitHub Actions CI/CD workflows, ensuring secure, repeatable, and environment-specific deployments.

---

## 🧱 Architecture

The infrastructure includes the following AWS resources:

* **AWS Lambda Function**: A simple serverless function written in JavaScript (`lambda.js`) deployed using Terraform.
* **IAM Role**: A role that grants the Lambda function permission to execute.
* **S3 Bucket (Terraform Backend)**: Stores the Terraform state file securely and consistently across environments.
* **Terraform Artifacts**: A `lambda_function_payload.zip` package created from the Lambda source code.
* **GitHub Actions Workflows**: Automates Terraform plan and apply steps, with built-in cost estimation and manual approval gates.

---


---

## ⚙️ Features

* **Infrastructure as Code (IaC)** using Terraform for consistent and predictable deployments.
* **CI/CD with GitHub Actions** to automate plan and apply stages.
* **Environment Isolation** using separate `*.tfvars` files for dev, uat, and prod.
* **Cost Summary Report** to estimate monthly cloud costs before provisioning.
* **Secure AWS Credential Handling** via GitHub secrets.
* **Manual Approval Workflow** before applying infrastructure changes to cloud.

---

## 📋 Workflow Summary

The GitHub Actions workflow performs the following steps:

1. **Code Checkout**: Retrieves the code from the GitHub repository.
2. **AWS Authentication**: Uses stored secrets to authenticate to AWS.
3. **S3 Bucket Validation**: Ensures the remote state bucket exists (creates it if missing).
4. **Lambda Packaging**: Zips the source code before deployment.
5. **Terraform Initialization**: Prepares the Terraform backend and providers.
6. **Terraform Plan**: Generates an execution plan and uploads it as an artifact.
7. **Cost Estimation**: Provides a breakdown of expected monthly AWS costs.
8. **Manual Approval**: Requires a reviewer to approve before applying changes.
9. **Terraform Apply**: Applies infrastructure changes using the uploaded plan.

---

## 🔐 Security Practices

* **AWS credentials** are stored in GitHub Secrets and never hardcoded.
* **Terraform state** is stored in versioned, encrypted S3 buckets.
* **IAM roles** are limited in scope and grant only necessary permissions.

---

## 🌍 Supported Environments

* `dev`
* `uat`
* `prod`

Each environment can be targeted by using its respective `.tfvars` file, keeping infrastructure deployments clean, isolated, and manageable.

---

## 🧪 Prerequisites

To use or adapt this project, ensure:

* You have access to an AWS account with permissions to create IAM roles, Lambda functions, and S3 buckets.
* GitHub repository secrets are correctly configured:

  * `AWS_ACCESS_KEY_ID`
  * `AWS_SECRET_ACCESS_KEY`
* The GitHub Actions runner has access to Terraform and AWS CLI.

---

## ✅ Use Cases

* Deploying serverless microservices automatically on code pushes.
* Enforcing review gates before infrastructure modifications.
* Estimating and monitoring monthly cloud costs pre-deployment.
* Maintaining infrastructure consistency across multiple environments.



