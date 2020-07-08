variable "ssh_public_key_file" {
  type = string
  description = "Path to the public SSH key file required for accessing the AWS environment"
  default = "~/.ssh/heticmadu.pub"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "vpc_id" {
  type = string
}
