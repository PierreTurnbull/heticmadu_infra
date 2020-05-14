variable "ssh_public_key_file" {
  type = string
  description = "Path to the public SSH key file required for accessing the AWS environment"
  default = "~/.ssh/heticmadu.pub"
}
