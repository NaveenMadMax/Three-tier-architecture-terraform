variable "project_name" {
  description = "The name of the project"
  type        = string  
}
variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string 
}
variable "instance_type" {
  description = "The type of instance to create"
  type        = string   
}
variable "public_subnet_ids" {
  description = "The ID of the public subnet to launch the instance in"
  type        = list(string) 
}
variable "private_subnet_ids" {
  description = "The ID of the private subnet to launch the instance in"
  type        = list(string)   
}
variable "vpc_id" {
  description = "The ID of the VPC to launch the instance in"
  type        = string   
}
variable "security_groups_id" {
    type = string
    description = "values of security groups"
  
}
variable "key_name" {
  description = "SSH key pair name to access EC2 instances"
  type        = string
}