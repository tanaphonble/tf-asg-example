provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    key = "stage/data-stores/mysql/terraform.tfstate"
  }
}

module "data_sources" {
  source = "github.com/tanaphonble/tf-modules//data-stores/mysql?ref=v0.0.2"

  cluster_name      = "data-sources-stage"
  db_name           = "dbinstancet2microstage"
  db_username       = "admin"
  db_pass_secret_id = "master-password-mysql-stage"
  db_instance_class = "db.t2.micro"
}

