provider "aws" {
  region = "us-east-1"  
}

resource "aws_s3_bucket" "example" {
  bucket = "sravanthi12345" 

  tags = {
    Name        = "example-bucket"
    Environment = "Dev"
  }
}
