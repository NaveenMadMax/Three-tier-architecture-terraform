output "vpc_id" {
  value = aws_vpc.terraform.id
  description = "The ID of the VPC" 
}
output "public_subnet_ids" {
  value = aws_subnet.terraform_public[*].id
  description = "The IDs of the public subnets"
}
output "private_subnet_ids" {
  value = aws_subnet.terraform_private[*].id
  description = "The IDs of the private subnets"  
}
output "nat_gateway_id" {
  value = aws_nat_gateway.terraform_nat[0].id
  description = "The ID of the NAT gateway"
}
output "internet_gateway_id" {
  value = aws_internet_gateway.terraform_igw.id
  description = "The ID of the internet gateway"  
}
output "frontend_security_group_ids" {
  value = aws_security_group.terraform-frontend-sg.id
  description = "The IDs of the security groups"  
}
output "backend_security_group_ids" {
  value = aws_security_group.terraform-backend-sg.id
  description = "The IDs of the security groups"    
}
output "database_security_group_ids" {
  value = aws_security_group.terraform-database-sg.id
  description = "The IDs of the security groups"    
}