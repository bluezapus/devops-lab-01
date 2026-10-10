resource "aws_db_subnet_group" "this" {
  name       = "${var.project_name}-${var.environment}-db-subnets"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.project_name}-${var.environment}-db-subnets"
    Environment = var.environment
  }
}

resource "aws_security_group" "this" {
  name        = "${var.project_name}-${var.environment}-rds-sg"
  description = "Allow MySQL only from approved security groups"
  vpc_id      = var.vpc_id

  ingress {
    description     = "MySQL from approved application security groups"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = var.allowed_security_group_ids
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-rds-sg"
    Environment = var.environment
  }
}

resource "aws_db_instance" "this" {
  identifier                  = "${var.project_name}-${var.environment}-mysql"
  engine                      = "mysql"
  instance_class              = var.db_instance_class
  allocated_storage           = 20
  storage_type                = "gp3"
  db_name                     = var.db_name
  username                    = var.db_username
  manage_master_user_password = true
  port                        = 3306
  db_subnet_group_name        = aws_db_subnet_group.this.name
  vpc_security_group_ids      = [aws_security_group.this.id]
  publicly_accessible         = false
  storage_encrypted           = true
  backup_retention_period     = 1
  skip_final_snapshot         = true
  deletion_protection         = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-mysql"
    Environment = var.environment
  }
}
