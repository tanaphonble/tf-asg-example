provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    key = "stage/services/webserver-cluster/terraform.tfstate"
  }
}

module "webserver_cluster" {
  source = "github.com/tanaphonble/tf-modules//services/webserver-cluster?ref=v0.2.2"

  cluster_name           = "webservers-stage"
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


resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = module.webserver_cluster.alb_security_group_id

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
