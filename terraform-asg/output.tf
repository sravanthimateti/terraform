# Output for the Auto Scaling Group name
output "asg_name" {
  description = "The name of the Auto Scaling Group"
  value       = aws_autoscaling_group.example.name
}

# Output for the launch template ID
output "launch_template_id" {
  description = "The ID of the launch template"
  value       = aws_launch_template.example.id
}

# Output for the security group ID
output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.instance.id
}
