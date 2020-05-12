provider "aws" {
  region  = "eu-west-3"
}

resource "aws_key_pair" "heticmadu_key_pair" {
  key_name    = "heticmadu"
  public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDlCOqXqzZXOf39Fou2TgQ0CVFODUkSiG2iMh9hbME/yiKWiqE+5lwGD1t7WG724m5qY6SKqdltUCnuUeJFXC2R6l1yBuSCMTb5CxQaf4l4BBs/tcSZGcMO4affqMq31LoxRFW4aA5UU3jS14whZeXM1z9BztQ2Pwllp9RPxGjfKfXd1ge8pzW1wluu7ISAiZQxwNNg//MIBazrxBxw+PxtT/3eH3QF0Js/q4tV1cGy1U39kNH/pF3nJAmxWED5sEEjZNxMeI28sl0pP0V0kf5lIqJQjKtVhoI1++KdPoJPkbNDEmBlAFXxdak6DYW5eFp68XOsUkWP+Sh/38XhjPYV heticmadu@gmail.com"
}

resource "aws_instance" "heticmadu_instance" {
  ami                     = "ami-087855b6c8b59a9e4"
  instance_type           = "t2.micro"
  key_name                = "heticmadu"
  vpc_security_group_ids  = [aws_security_group.heticmadu_security_group.id]
  # subnet_id = data.terraform_remote_state.remote_state.outputs.subnet_id
  tags = {
    Name = "heticmadu"
  }
}

resource "aws_default_vpc" "heticmadu_default_vpc" {}

resource "aws_security_group" "heticmadu_security_group" {
  name            = "heticmadu"
  description     = "heticmadu security group"
  vpc_id          = aws_default_vpc.heticmadu_default_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 4000
    to_port     = 4000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "heticmadu"
  }
}
