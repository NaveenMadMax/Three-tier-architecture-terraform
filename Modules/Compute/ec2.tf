resource "aws_instance" "terraform_frontend" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [ var.security_groups_id ]

  tags={
    Name = "${var.project_name}-frontend"
  }
}

resource "aws_instance" "terraform_backend" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.private_subnet_id
  vpc_security_group_ids = [ var.security_groups_id ]

  tags={
    Name = "${var.project_name}-backend"
  }
}