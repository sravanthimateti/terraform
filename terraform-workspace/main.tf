provider "aws" {
  region = "us-east-1"
}

variable "ami" {
  description = "ID of AMI"
}

variable "instance_type" {
  description = "Instance type for the instance"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.xlarge"
  }
}

module "ec2_instance" {
  source              = "./modules/ec2_instance"
  ami           = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}
