# Provider Configuration
provider "aws" {
  region = var.aws_region
}

# Data source to get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Data source to get the default subnet from the default VPC
data "aws_subnet" "default_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
  filter {
    name   = "availability-zone"
    values = ["us-east-1a"] # Specify an availability zone
  } 
  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

# Data source to get the latest Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]  # Ubuntu 20.04 LTS
  }

}

# Security Group for EC2 Instance
resource "aws_security_group" "instance_sg" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id = data.aws_subnet.default_subnet.id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
 
  tags = {
    Name = var.instance_name
  }
}
