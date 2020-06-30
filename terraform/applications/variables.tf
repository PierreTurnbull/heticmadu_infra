variable "ami" {
  type = string
  description = "AMI to use for instances"
}

variable "key_name" {
  type = string
  description = "AWS EC2 key name"
}

variable "stage" {
  type = string
  default = "preprod"
  description = "Stage in which the project is deployed"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}
