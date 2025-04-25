resource "aws_vpc" "terraform" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
      Name: "${var.three-tier-architecture}-vpc"
    }
}