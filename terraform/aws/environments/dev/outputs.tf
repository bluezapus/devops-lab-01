output "vpc_id" {
  description = "ID of the development VPC"
  value       = module.network.vpc_id
}

output "public_subnet_id" {
  description = "ID of the development public subnet"
  value       = module.network.public_subnet_id
}

output "ecr_repository_name" {
  description = "Name of the ECR repository"
  value       = module.ecr.repository_name
}

output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = module.ecr.repository_url
}
