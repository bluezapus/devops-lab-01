output "project_name" {
  description = "Project name used in this Terraform lab"
  value       = var.project_name
}

output "managed_file" {
  description = "Path of the file managed by Terraform"
  value       = local_file.lab_info.filename
}
