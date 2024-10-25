# Define the provider
provider "aws" {
  region = var.aws_region
}

# Create a Security Group
resource "aws_security_group" "example_sg" {
  name   = "example_sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example_sg"
  }
}

# Create a Launch Template
resource "aws_launch_template" "example" {
  name_prefix   = "example-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type

  key_name = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.example_sg.id]
  }

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = var.volume_size
      volume_type = "gp2"
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "example-instance"
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "example-launch-template"
  }
}

# Launch EC2 instances using this Launch Template
resource "aws_instance" "example_instance" {
  count           = var.instance_count
  ami             = aws_launch_template.example.image_id
  instance_type   = aws_launch_template.example.instance_type
  key_name        = aws_launch_template.example.key_name
  subnet_id       = var.subnet_id

  security_groups = [aws_security_group.example_sg.id]

  tags = {
    Name = "example-instance"
  }
}
