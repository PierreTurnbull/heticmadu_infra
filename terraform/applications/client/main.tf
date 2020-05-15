provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "client" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = var.key_name
  count         = var.instance_count

  security_groups = [aws_security_group.client.name]

  tags = {
    Name      = "heticmadu-${var.stage}-client"
    stage     = var.stage
    component = "client"
  }
}

resource "aws_security_group" "client" {
  name        = "heticmadu-${var.stage}-client"
  description = "Allow inbound traffic"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "client"
    from_port   = 3000
    to_port     = 3000
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
    Name = "heticmadu-${var.stage}-client"
  }
}

resource "aws_elb" "client" {
  name               = "heticmadu-${var.stage}-client"
  availability_zones = ["eu-west-3a"]

  listener {
    instance_port     = 3000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:3000/"
    interval            = 30
  }

  instances                   = aws_instance.client.*.id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "heticmadu-${var.stage}-client"
  }
}
