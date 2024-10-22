# Provider configuration
provider "aws" {
  region = var.aws_region
}

# Create EFS file system
resource "aws_efs_file_system" "example" {
  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
  tags = {
    Name = var.efs_name
  }
}

# Create a security group for EFS
resource "aws_security_group" "efs_sg" {
  name        = "${var.efs_name}-sg"
  description = "Security group for EFS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.efs_name}-sg"
  }
}

# Create mount targets in each subnet
resource "aws_efs_mount_target" "example" {
  count          = length(var.subnet_ids)
  file_system_id = aws_efs_file_system.example.id
  subnet_id      = var.subnet_ids[count.index]
  security_groups = [
    aws_security_group.efs_sg.id
  ]
}
