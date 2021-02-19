provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    key = "stage/data-stores/mysql/terraform.tfstate"
  }
}

resource "aws_db_instance" "instance" {
  identifier_prefix         = "${var.cluster_name}-db"
  engine                    = "mysql"
  allocated_storage         = 10
  instance_class            = var.db_instance_class
  name                      = var.db_name
  username                  = var.db_username
  final_snapshot_identifier = "${var.db_name}-identifier"

  password = data.aws_secretsmanager_secret_version.db_password.secret_string
}

data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = var.db_pass_secret_id
}

