# AWS Architecture — DevOps Lab 01

## Overview

This project reproduces a cloud-native Petclinic-style application
using Terraform-managed AWS infrastructure.

The AWS infrastructure is defined as reusable Terraform modules.

## Terraform Structure

- `terraform/aws/environments/dev`: development environment configuration.
- `terraform/aws/modules/network`: VPC, public subnets, private subnets,
  Internet Gateway, and route tables.
- `terraform/aws/modules/ecr`: container image repository.
- `terraform/aws/modules/eks`: Amazon EKS control plane and IAM role.
- `terraform/aws/modules/rds`: managed MySQL database and security group.

## Intended Architecture

1. GitHub Actions builds and tests the Customers Service.
2. A container image is published to a container registry.
3. Amazon ECR stores images intended for AWS deployments.
4. Amazon EKS runs the containerized application.
5. Amazon RDS provides the MySQL database.
6. VPC subnets and security groups define network boundaries.

## Current Limitations

This repository currently contains infrastructure configuration only.
No AWS resources have been created.

Before deployment:

- Verify that the selected Availability Zones are available.
- Configure EKS networking across at least two Availability Zones.
- Add and configure EKS worker nodes or another supported compute option.
- Configure private subnet egress, such as NAT or required VPC endpoints.
- Restrict RDS access to the application's security group.
- Configure application database credentials using AWS Secrets Manager.
- Review Terraform state storage and locking for team use.
- Review AWS costs before creating any resources.

The current EKS module defines the control plane only.
The RDS module is not yet connected to an application security group.
The current private subnets do not have a route to the internet.

## Local Validation

Terraform formatting and static validation can be performed without
creating AWS resources:

```bash
terraform -chdir=terraform/aws/environments/dev fmt -recursive
terraform -chdir=terraform/aws/environments/dev validate

A real AWS plan may require valid AWS credentials and access to AWS APIs. Do not run terraform apply until the architecture and expected costs have been reviewed
