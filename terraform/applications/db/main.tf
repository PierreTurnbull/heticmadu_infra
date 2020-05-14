resource "aws_security_group" "db" {
  name   = "heticmadu-${var.stage}-db"
  vpc_id = "vpc-02ddb8bce632aee0d"

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "db" {
  identifier                  = "heticmadu-${var.stage}"
  allocated_storage           = 10
  max_allocated_storage       = 100
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "5.7"
  instance_class              = "db.t2.micro"
  name                        = var.stage
  username                    = "username"
  password                    = "password"
  parameter_group_name        = "default.mysql5.7"
  vpc_security_group_ids      = [aws_security_group.db.id]
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  backup_retention_period     = 35
  backup_window               = "01:00-02:00"
  maintenance_window          = "Sat:03:00-Sat:06:00"
  multi_az                    = true
  skip_final_snapshot         = true
}

# TODO : bucket backup

# TODO : backup hook before rebuilding prod db
