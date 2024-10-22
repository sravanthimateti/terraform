# AWS region
variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-west-2"
}

# VPC ID
variable "vpc_id" {
  description = "The ID of the VPC where EFS is created"
  type        = string
}

# List of subnet IDs for mount targets
variable "subnet_ids" {
  description = "List of subnet IDs to create EFS mount targets"
  type        = list(string)
}

# EFS name
variable "efs_name" {
  description = "Name of the EFS file system"
  type        = string
  default     = "example-efs"
}

# CIDR blocks allowed to access EFS
variable "allowed_cidrs" {
  description = "Allowed CIDR blocks to access EFS"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
