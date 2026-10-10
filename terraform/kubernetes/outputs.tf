output "namespace_name" {
  description = "Kubernetes namespace managed by Terraform"
  value       = kubernetes_namespace_v1.terraform_lab.metadata[0].name
}
