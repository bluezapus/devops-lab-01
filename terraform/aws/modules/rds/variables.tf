variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs for RDS"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for the database security group"
  type        = string
}

variable "allowed_security_group_ids" {
  description = "Security groups permitted to connect to MySQL"
  type        = list(string)
  default     = []
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "petclinic"
}

variable "db_username" {
  description = "Master database username"
  type        = string
  default     = "petclinic"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t4g.micro"
}
