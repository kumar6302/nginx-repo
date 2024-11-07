output "cluster_endpoint" {
  value = var.cluster_endpoint  # Reference the variable passed to the nginx module
}

output "cluster_certificate_authority_data" {
  value = var.cluster_certificate_authority_data  # Reference the variable passed to the nginx module
}

output "cluster_name" {
  value = var.cluster_name  # Reference the variable passed to the nginx module
}
