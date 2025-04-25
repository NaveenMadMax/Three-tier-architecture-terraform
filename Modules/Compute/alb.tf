resource "aws_alb" "terraform_alb" {
  name               = "${var.project_name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_groups_id]
  subnets            = var.public_subnet_ids

  tags = {
    Name = "${var.project_name}-alb"
  }
}

resource "aws_alb_target_group" "terraform_alg_tg" {
   name     = "${var.project_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_alb_listener" "terraform_alb_listener" {
  load_balancer_arn = aws_alb.terraform_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.terraform_alg_tg.arn
  }
}
resource "aws_alb_target_group_attachment" "frontend_attachment" {
  target_group_arn = aws_alb_target_group.terraform_alg_tg.arn
  target_id        = aws_instance.terraform_frontend.id
  port            = 80
  
}

resource "aws_alb_target_group_attachment" "backend_attachment" {
  target_group_arn = aws_alb_target_group.terraform_alg_tg.arn
  target_id        = aws_instance.terraform_backend.id
  port            = 80
  
}