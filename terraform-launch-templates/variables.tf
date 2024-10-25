variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the launch template"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
}

variable "volume_size" {
  description = "The size of the root EBS volume"
  type        = number
  default     = 10
}

variable "subnet_id" {
  description = "The Subnet ID for the EC2 instances"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 2
}
