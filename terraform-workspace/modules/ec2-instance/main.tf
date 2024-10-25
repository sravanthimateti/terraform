provider "aws" {
  region = "us-east-1"
}

variable "ami" {
  description = "ID of AMI to use for the instance"
}

variable "instance_type" {
  description = "Instance type to use for the instance"
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
} 
