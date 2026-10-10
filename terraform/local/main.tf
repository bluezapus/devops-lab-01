terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

resource "local_file" "lab_info" {
  filename = "${path.module}/lab-info.txt"
  content  = "DevOps Lab - managed by Terraform\n"
}

