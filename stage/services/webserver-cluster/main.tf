provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    key = "stage/services/webserver-cluster/terraform.tfstate"
  }
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluter"
}
