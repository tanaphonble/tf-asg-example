provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
  }
}

module "webserver_cluster" {
  source = "github.com/tanaphonble/tf-modules//services/hello-world-app?ref=v1.1.0"

  server_text            = "New Server v3"
  environment            = var.environment            # "stage"
  db_remote_state_bucket = var.db_remote_state_bucket # "terraform-state-rdnudxq0"
  db_remote_state_key    = var.db_remote_state_key    # "stage/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 1
  max_size      = 1

  enable_autoscaling = false

  custom_tags = {
    Owner      = "team-ble"
    DeployedBy = "terraform"
  }
}
