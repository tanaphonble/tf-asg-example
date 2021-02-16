provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    key = "stage/data-stores/mysql/terraform.tfstate"
  }
}

module "data_sources" {
  source = "../../../modules/data-sources/mysql"

  cluster_name      = "data-sources-stage"
  db_name           = "db-instance-stage"
  db_username       = "admin"
  db_pass_secret_id = "mysql-pass-stage"
  instance_class    = "db.t2.micro"
}
