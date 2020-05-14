variable "ami" {
  type = string
  description = "AMI to use for instances"
}

variable "key_name" {
  type = string
  description = "AWS EC2 Key name to use for instances"
}

variable "stage" {
  type = string
  default = "preprod"
  description = "Stage in which application is deployed"
}

variable "instance_count" {
  type = number
  description = "Number of instances"
}