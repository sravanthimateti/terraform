variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
}
variable "instance_type" {
  description = "Instance type to use for the instance"
  type        = string
  default     = "t2.micro"
}
variable "environment" {
  description = "Environment"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for the EC2 instance"
  type        = string
}
