provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "sravanthi1804"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet.id

  tags = {
    Name = "MyInstance"
  }
}
