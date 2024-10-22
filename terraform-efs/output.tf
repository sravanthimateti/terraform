# Output the EFS file system ID
output "efs_id" {
  description = "The ID of the EFS file system"
  value       = aws_efs_file_system.example.id
}

# Output the EFS DNS name
output "efs_dns" {
  description = "The DNS name of the EFS file system"
  value       = aws_efs_file_system.example.dns_name
}
