# Modules

module "client" {
  source          = "./client"
  ami             = var.ami
  key_name        = var.key_name
  stage           = var.stage
  instance_count  = 2
}

module "api" {
  source          = "./api"
  ami             = var.ami
  key_name        = var.key_name
  stage           = var.stage
  instance_count  = 2
}

module "db" {
  source                        = "./db"
  stage                         = var.stage
  authorized_security_group_id  = module.api.authorized_security_group_id
  db_username                   = var.db_username
  db_password                   = var.db_password
}
