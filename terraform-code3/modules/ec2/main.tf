resource "aws_instance" "example_ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
 
  tags = {
    Name = "HelloWorld"
  }
}
