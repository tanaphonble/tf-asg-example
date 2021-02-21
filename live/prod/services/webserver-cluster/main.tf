provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    key = "prod/services/webserver-cluster/terraform.tfstate"
  }
}

module "webserver_cluster" {
  source = "github.com/tanaphonble/tf-modules//services/webserver-cluster?ref=v0.1.3"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "terraform-state-rdnudxq0"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 10

  enable_autoscaling = true
}
