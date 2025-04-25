provider "aws" {
  region = "us-west-2"
  profile = "terraform"
  shared_credentials_files = ["C:/Users/MADMAX/.aws/credentials"]
}
data "aws_availability_zones" "available" {}
