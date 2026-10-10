output "db_instance_identifier" {
  description = "RDS instance identifier"
  value       = aws_db_instance.this.identifier
}

output "db_endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.this.endpoint
}

output "db_security_group_id" {
  description = "Security group ID attached to RDS"
  value       = aws_security_group.this.id
}
