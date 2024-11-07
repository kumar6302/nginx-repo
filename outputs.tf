output "kubeconfig" {
  value = module.eks.kubeconfig
}

output "eks_cluster_sg_id" {
  value = module.eks.eks_cluster_sg_id  # Update this to reference module.eks
}

output "eks_node_sg_id" {
  value = module.eks.eks_node_sg_id  # Update this to reference module.eks
}

