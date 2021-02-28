provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
  }
}

module "data_sources" {
  source = "github.com/tanaphonble/tf-modules//data-stores/mysql?ref=v1.1.0"

  identifier_prefix = "rds-stage"
  db_name           = "dbinstancet2microstage"
  db_username       = "admin"
  db_password       = var.db_password
  db_instance_class = "db.t2.micro"
}

