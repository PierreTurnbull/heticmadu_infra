provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "api" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = var.key_name
  count         = var.instance_count

  security_groups = [aws_security_group.api.name]

  tags = {
    Name      = "heticmadu-${var.stage}-api"
    stage     = var.stage
  }
}

resource "aws_security_group" "api" {
  name        = "heticmadu-${var.stage}-api"
  description = "Allow inbound traffic"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP web app"
    from_port   = 4000
    to_port     = 4000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "heticmadu-${var.stage}-api"
  }
}
