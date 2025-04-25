terraform {
  backend "s3" {
    bucket         = "terraform1062"
    key            = "terraform.tfstate"
    region         = "us-west-2"    
  }
}