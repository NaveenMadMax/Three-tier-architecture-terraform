variable "project_name" {
  type = string
  description = "The name of the project"
}
variable "db_engine" {
  type = string
  description = "The database engine to use"
  default = "mysql"
}
variable "db_engine_version" {
  type = string
  description = "The version of the database engine to use"
  default = "8.0.40"  
}
variable "db_instance_class" {
  type = string
  description = "The instance class for the database"
  default = "db.t3.micro"  
}
variable "db_username" {
  type = string
  description = "The username for the database"  
}
variable "db_password" {
  type = string
  description = "The password for the database"
  sensitive = true
}
variable "private_subnet_ids" {
    type = list(string)
    description = "The private subnet IDs for the database"
}
variable "db_security_group_id" {
    type = string
    description = "The security group ID for the database"  
}
