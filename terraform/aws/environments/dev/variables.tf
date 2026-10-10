variable "aws_region" {
  description = "AWS region for the development environment"
  type        = string
  default     = "ap-southeast-1"
}

variable "project_name" {
  description = "Project name used in resource tags"
  type        = string
  default     = "devops-lab-01"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR range for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR range for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the public subnet"
  type        = string
  default     = "ap-southeast-1a"
}
