output "db_instance_endpoint" {
  value = aws_db_instance.terraform_db.endpoint
}
output "db_instance_id" {
  value = aws_db_instance.terraform_db.id
  
}