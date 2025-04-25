resource "aws_subnet" "terraform_public" {
  count = length(var.public_subnet_cidrs)
  vpc_id = aws_vpc.terraform.id
  cidr_block = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name: "${var.project_name}-public-subnet-${count.index}"
  }
}
resource "aws_subnet" "terraform_private" {
  count = length(var.private_subnet_cidrs)
  vpc_id = aws_vpc.terraform.id
  cidr_block = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name: "${var.project_name}-private-subnet-${count.index}"
  }
  
}