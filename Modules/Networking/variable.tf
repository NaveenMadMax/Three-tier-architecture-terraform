variable "three-tier-architecture" {
  description = "Three-tier architecture flag"
  type        = string
}
variable "vpc_cidr" {
  type = string
  description = "CIDR block for the VPC"
}
variable "public_subnet_cidrs" {
  type = list(string)
  description = "List of CIDR blocks for public subnets"
}
variable "private_subnet_cidrs" {
  type = list(string)
  description = "List of CIDR blocks for private subnets"  
}
variable "availability_zones" {
  type = list(string)
  description = "List of availability zones for the VPC"
}
variable "enable_nat_gateway" {
  type        = bool
  default     = true
  description = "Enable NAT gateway for private subnets"
}
