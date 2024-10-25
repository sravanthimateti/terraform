output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.myvpc.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.sub1.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "route_table_id" {
  description = "The ID of the Route Table"
  value       = aws_route_table.RT.id
}

output "security_group_id" {
  description = "The ID of the Security Group"
  value       = aws_security_group.webSg.id
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.server.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.server.public_ip
}
