resource "aws_db_subnet_group" "terraform_db_sg" {
  name       = "${var.project_name}-db-sg"
  subnet_ids = var.private_subnet_ids
  tags = {
    Name = "${var.project_name}-db-sg"
  }
  
}

resource "aws_db_instance" "terraform_db" {
  identifier         = "${var.project_name}-db"
  engine             = var.db_engine
  engine_version     = var.db_engine_version
  instance_class     = var.db_instance_class
  allocated_storage   = 20
  storage_type       = "gp2"
  username           = var.db_username
  password           = var.db_password
  db_subnet_group_name = aws_db_subnet_group.terraform_db_sg.name
  vpc_security_group_ids = [var.db_security_group_id]
  skip_final_snapshot = true
  publicly_accessible     = false
  multi_az                = false

  tags = {
    Name = "${var.project_name}-db"
  }
  
}