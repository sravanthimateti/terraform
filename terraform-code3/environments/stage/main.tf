provider "aws" {
  region = "us-east-1"
}


module "example_ec2_instance" {
  source              = "../../modules/ec2"
  ami                 = "ami-0e86e20dae9224db8"
  instance_type       = "t2.micro"
  environment         = "stage"
  availability_zone   = "us-east-1b"
}
