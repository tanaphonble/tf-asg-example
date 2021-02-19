variable "cluster_name" {
  description = "The name of the cluster"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_username" {
  description = "The database username"
  type        = string
}

variable "db_pass_secret_id" {
  description = "The password for the MySQL"
  type        = string
}

variable "db_instance_class" {
  description = "The class of the instance to use for the database (e.g. db.t2.micro)"
  type        = string
}
