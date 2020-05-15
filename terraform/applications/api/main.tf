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
    component = "api"
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
    description = "api"
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

output "authorized_security_group_id" {
  value = aws_security_group.api.id
}

resource "aws_elb" "api" {
  name               = "heticmadu-${var.stage}-api"
  availability_zones = ["eu-west-3a"]

  listener {
    instance_port     = 4000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:4000/api"
    interval            = 30
  }

  instances                   = aws_instance.api.*.id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "heticmadu-${var.stage}-api"
  }
}
