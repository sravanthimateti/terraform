output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.example_sg.id
}

output "launch_template_id" {
  description = "The ID of the launch template"
  value       = aws_launch_template.example.id
}

output "instance_ids" {
  description = "The IDs of the launched EC2 instances"
  value       = aws_instance.example_instance[*].id
}
