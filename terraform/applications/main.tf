# Modules

module "api" {
  source          = "./api"
  ami             = var.ami
  key_name        = var.key_name
  stage           = var.stage
  instance_count  = 2
}

module "db" {
  source          = "./db"
  stage           = var.stage
}
