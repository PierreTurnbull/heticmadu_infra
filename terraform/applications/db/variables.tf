variable "stage" {
  type = string
  default = "preprod"
  description = "Stage in which application is deployed"
}

variable "authorized_security_group_id" {
  type = string
  description = "Security group of instances allowed to access the database"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}
