provider "aws" {
  region  = "eu-west-3"
}

# Global resources

resource "aws_key_pair" "heticmadu" {
  key_name    = "heticmadu"
  public_key  = file(var.ssh_public_key_file)
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Modules

module "preprod" {
  source = "./applications"

  ami = data.aws_ami.ubuntu.id
  key_name = aws_key_pair.heticmadu.key_name
  stage = "preprod"
  db_username = var.db_username
  db_password = var.db_password
}

module  "prod" {
  source = "./applications"

  ami = data.aws_ami.ubuntu.id
  key_name = aws_key_pair.heticmadu.key_name
  stage = "prod"
  db_username = var.db_username
  db_password = var.db_password
}
