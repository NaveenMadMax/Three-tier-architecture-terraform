# Networking Module
module "networking" {
  source = "./Modules/Networking"
  project_name          = var.project_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  enable_nat_gateway   = var.enable_nat_gateway
}

# Compute Module
module "compute" {
  source               = "./Modules/Compute"
  key_name             = var.key_name 
  project_name         = var.project_name
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  public_subnet_ids     = module.networking.public_subnet_ids
  private_subnet_ids    = module.networking.private_subnet_ids
  vpc_id               = module.networking.vpc_id
  security_groups_id   = module.networking.frontend_security_group_ids
}

# Database Module
module "database" {
  source               = "./Modules/Database"
  project_name         = var.project_name
  db_engine            = var.db_engine
  db_engine_version    = var.db_engine_version
  db_instance_class    = var.db_instance_class
  db_username          = var.db_username
  db_password          = var.db_password
  private_subnet_ids   = module.networking.private_subnet_ids
  db_security_group_id = module.networking.database_security_group_ids
}
