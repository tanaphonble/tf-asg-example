provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    key = "prod/services/webserver-cluster/terraform.tfstate"
  }
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluter"
}
