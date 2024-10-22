# AWS Region
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

# AMI ID for the EC2 instance
variable "ami_id" {
  description = "The AMI ID to use for launching EC2 instances"
  type        = string
}

# Instance type for EC2
variable "instance_type" {
  description = "The instance type to use for the EC2 instances"
  type        = string
  default     = "t2.micro"
}

# Key pair name
variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
}

# Size of the EBS volume
variable "volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
  default     = 8
}

# Subnet IDs for Auto Scaling Group
variable "subnet_ids" {
  description = "List of subnet IDs for the Auto Scaling Group"
  type        = list(string)
}

# Desired number of EC2 instances
variable "desired_capacity" {
  description = "Desired number of EC2 instances"
  type        = number
  default     = 2
}

# Maximum number of EC2 instances
variable "max_size" {
  description = "Maximum number of EC2 instances"
  type        = number
  default     = 3
}

# Minimum number of EC2 instances
variable "min_size" {
  description = "Minimum number of EC2 instances"
  type        = number
  default     = 1
}
