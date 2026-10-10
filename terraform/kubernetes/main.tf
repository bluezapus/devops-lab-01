terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-devops-lab-01"
}

resource "kubernetes_namespace_v1" "terraform_lab" {
  metadata {
    name = "terraform-lab"
  }
}
