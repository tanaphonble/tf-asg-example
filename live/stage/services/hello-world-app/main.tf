provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    key = "stage/services/webserver-cluster/terraform.tfstate"
  }
}

module "webserver_cluster" {
  source = "github.com/tanaphonble/tf-modules//services/hello-world-app?ref=v1.0.3"

  server_text            = "New Server v3"
  environment            = "stage"
  db_remote_state_bucket = "terraform-state-rdnudxq0"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 1
  max_size      = 1

  enable_autoscaling = false

  custom_tags = {
    Owner      = "team-ble"
    DeployedBy = "terraform"
  }
}
