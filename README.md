# AWS_Lambda
# 🚀 AWS Lambda Deployment Using Terraform and GitHub Actions

This project demonstrates how to **deploy an AWS Lambda function** using **Terraform** infrastructure-as-code and automate it via a **CI/CD pipeline with GitHub Actions**.

---

## 🧩 Project Overview

The repository is designed to:

* Define AWS infrastructure using **Terraform**
* Package and deploy a **Node.js Lambda function**
* Use **GitHub Actions** to automate deployment to AWS on every `push` to the `main` branch

---

## 🔧 What’s Included?

### 1. **Lambda Function**

The project deploys a simple AWS Lambda function written in **Node.js** (`lambda.js`). The function returns a "Hello from Lambda!" response. You can customize this function as needed.

### 2. **IAM Role for Lambda**

Terraform creates an **IAM Role** with a trust policy that allows **Lambda** to assume it. This is a minimal role required to execute the function.

### 3. **Lambda Packaging**

Terraform uses the `archive_file` data source to package the Lambda function into a `.zip` file for deployment.

### 4. **Randomization**

To avoid naming collisions, Terraform generates random suffixes for resource names (e.g., the Lambda function name).

---

## 🔁 CI/CD Pipeline with GitHub Actions

Every time you **push to the `main` branch**, GitHub Actions automatically:

1. **Checks out the code**
2. **Installs Terraform**
3. **Authenticates to AWS using secrets**
4. **Runs `terraform init`**
5. **Runs `terraform plan`**
6. **Applies the Terraform plan to provision resources**

This pipeline provides **automated, consistent, and repeatable deployments**.

---

## 🚀 Getting Started

### ✅ Prerequisites

* An **AWS account**
* An IAM user with permissions to create:

  * Lambda Functions
  * IAM Roles
  * CloudWatch Logs
* Terraform installed (>= v1.2)
* Node.js installed (for authoring Lambda)
* GitHub repository with:

  * `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` saved in **GitHub secrets**

### 🛠 Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/your-username/terraform-aws-lambda.git
   cd terraform-aws-lambda
   ```

2. **Write your Lambda code**
   Edit `lambda.js` to contain your function logic.

3. **Commit and Push**
   Push changes to `main` to trigger the GitHub Actions pipeline.

4. **Terraform runs automatically**
   Your Lambda will be deployed, and function name will be shown in workflow output.

---

## 🔐 Secrets Setup (GitHub)

In your repository settings:

1. Go to **Settings > Secrets and variables > Actions**
2. Add:

   * `AWS_ACCESS_KEY_ID`
   * `AWS_SECRET_ACCESS_KEY`

---

## 📤 Outputs

After a successful deployment, Terraform will output the **Lambda function name** (e.g., `lambda-xyz123`). You can verify the function in the AWS Lambda console under region `us-east-2`.

---

## 🔄 Making Changes

* Modify the Lambda code → Commit → Push
* GitHub Actions redeploys automatically

---

## 🧼 Clean-Up

To destroy the resources **manually**, you can run:

```bash
terraform destroy --auto-approve
```

> ⚠️ Destruction step is **not included in the CI/CD pipeline** by design to prevent accidental deletion.

---

