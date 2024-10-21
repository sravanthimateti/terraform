output "instance_id" {
  description = "The ID of the instance"
  value = aws_instance.example_ec2_instance.id
}
output "instance_public_ip" {
  description = "The Ip of the instance"
  value = aws_instance.example_ec2_instance.public_ip
}
