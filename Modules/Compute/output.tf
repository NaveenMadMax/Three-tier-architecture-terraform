output "frontend_instance_id" {
  value = aws_instance.terraform_frontend.id
}
output "backend_instance_id" {
  value = aws_instance.terraform_backend.id  
}
output "alb_arn" {
  value = aws_alb.terraform_alb.arn
}
output "alb_dns" {
  value = aws_alb.terraform_alb.dns_name
}