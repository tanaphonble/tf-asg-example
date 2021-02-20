provider "aws" {
  region = "ap-southeast-1"
}

variable "mysql_pass" {
  type        = string
  description = "The password for MySQL"
}

terraform {
  backend "s3" {
    key = "stage/secrets/secrets-manager/terraform.tfstate"
  }
}

resource "aws_secretsmanager_secret" "secret" {
  name = "master-password-mysql-stage"
}

resource "aws_secretsmanager_secret_version" "db_pass" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = var.mysql_pass
}
