resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.terraform.id

  tags = {
    Name = "${var.project_name}-igw"
  }
  
}
resource "aws_eip" "terraform_eip" {
  count = var.enable_nat_gateway ? 1 : 0
  domain   = "vpc"
}
resource "aws_nat_gateway" "terraform_nat" {
  count = var.enable_nat_gateway ? 1 : 0
  allocation_id = aws_eip.terraform_eip[0].id
  subnet_id = aws_subnet.terraform_public[0].id

  tags = {
    Name = "${var.project_name}-nat-gateway"
  }
}
resource "aws_route_table_association" "terraform_public_association" {
  count = length(aws_subnet.terraform_public)
  subnet_id = aws_subnet.terraform_public[count.index].id
  route_table_id = aws_route_table.terraform_public.id
}

resource "aws_route_table" "terraform_private" {
  count = length(aws_subnet.terraform_private)
  vpc_id = aws_vpc.terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform_nat[0].id
  }
    tags = {
    Name = "${var.project_name}-private-rt"
  }
}
resource "aws_route_table_association" "terraform_private_association" {
  count = length(aws_subnet.terraform_private)
  subnet_id = aws_subnet.terraform_private[count.index].id
  route_table_id = aws_route_table.terraform_private[count.index].id
  
}
