variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "image_id" {
  description = "The image id the instance will use for launching new instances"
  default     = "ami-09a6a7e49bd29554b"
}
