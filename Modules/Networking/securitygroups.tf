resource "aws_security_group" "terraform-frontend-sg " {
  vpc_id = aws_vpc.terraform.id
  name   = "${var.project_name}-frontend-sg"
  tags   = {
    Name = "${var.project_name}-frontend-sg"
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

resource "aws_security_group" "terraform-backend-sg" {
  vpc_id = aws_vpc.terraform.id
  name   = "${var.project_name}-backend-sg"
  tags   = {
    Name = "${var.project_name}-backend-sg"
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [ aws_security_group.terraform-frontend-sg.id  ]
}
   egress = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
}

resource "aws_security_group" "terraform-database-sg" {
  vpc_id = aws_vpc.terraform.id
  name   = "${var.project_name}-database-sg"
  tags   = {
    Name = "${var.project_name}-database-sg"
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [ aws_security_group.terraform-backend-sg.id  ]
  }
  egress ={
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}