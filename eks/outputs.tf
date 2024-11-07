# eks/outputs.tf

output "cluster_id" {
  value = aws_eks_cluster.nginx_cluster.id  # Reference the correct EKS cluster resource
}

output "cluster_name" {
  value = aws_eks_cluster.nginx_cluster.name
}

output "eks_cluster_sg_id" {
  value = aws_security_group.eks_cluster_sg.id
}

output "eks_node_sg_id" {
  value = aws_security_group.eks_node_sg.id
}

output "nginx_cluster" {
  value = aws_eks_cluster.nginx_cluster
}

output "cluster_endpoint" {
  value = aws_eks_cluster.nginx_cluster.endpoint
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.nginx_cluster.certificate_authority[0].data
}


output "kubeconfig" {
  value = jsonencode({
    apiVersion = "v1"
    clusters = [
      {
        cluster = {
          server                   = aws_eks_cluster.nginx_cluster.endpoint
          certificate-authority-data = base64encode(aws_eks_cluster.nginx_cluster.certificate_authority[0].data)
        }
        name = "nginx-cluster"
      }
    ]
    contexts = [
      {
        context = {
          cluster = "nginx-cluster"
          user    = "nginx-user"
        }
        name = "nginx-context"
      }
    ]
    users = [
      {
        name = "nginx-user"
        user = {
          exec = {
            apiVersion = "client.authentication.k8s.io/v1alpha1"
            command    = "aws"
            args       = ["eks", "get-token", "--cluster-name", "nginx-cluster"]
          }
        }
      }
    ]
    current-context = "nginx-context"
  })
}

