resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.terraform.id

  tags = {
    Name = "${var.three-tier-architecture}-igw"
  }
  
}
resource "aws_eip" "terraform_eip" {
  
}