variable "project_name" {
  type        = string
  description = "The name of the project"
}

variable "vpc_cidr" {
  type        = string
  description = "The VPC CIDR block"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "The public subnet CIDR blocks"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "The private subnet CIDR blocks"
}

variable "availability_zones" {
  type        = list(string)
  description = "The availability zones for the VPC"
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Whether to enable a NAT gateway"
}

variable "key_name" {
  type        = string
  description = "The EC2 key pair name"
}

variable "ami_id" {
  type        = string
  description = "The AMI ID to use for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "The EC2 instance type"
}

variable "db_engine" {
  type        = string
  description = "The database engine to use"
}

variable "db_engine_version" {
  type        = string
  description = "The version of the database engine to use"
}

variable "db_instance_class" {
  type        = string
  description = "The instance class for the database"
}

variable "db_username" {
  type        = string
  description = "The username for the database"
}

variable "db_password" {
  type        = string
  description = "The password for the database"
  sensitive   = true
}
