resource "aws_security_group" "terraform_frontend_sg" {
  vpc_id = aws_vpc.terraform.id
  name   = "${var.project_name}_frontend_sg"
  tags   = {
    Name = "${var.project_name}_frontend_sg"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

resource "aws_security_group" "terraform_backend_sg" {
  vpc_id = aws_vpc.terraform.id
  name   = "${var.project_name}_backend_sg"
  tags   = {
    Name = "${var.project_name}_backend_sg"
  } 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
          from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [ aws_security_group.terraform_frontend_sg.id  ]
    }
}

resource "aws_security_group" "terraform_database_sg" {
  vpc_id = aws_vpc.terraform.id
  name   = "${var.project_name}_database_sg"
  tags   = {
    Name = "${var.project_name}_database_sg"
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [ aws_security_group.terraform_backend_sg.id  ]  
}
}