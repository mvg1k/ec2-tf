provider "aws" {
  region     = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "tf-remotestate-mvgik-s3"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-rs-dynamo"
  }
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "my-test-secret" {
  name = var.s_name
}

resource "aws_secretsmanager_secret_version" "my-test-secret-version" {
  secret_id     = aws_secretsmanager_secret.my-test-secret.id
  secret_string = random_password.password.result
}