provider "kubernetes" {
  host                   = var.cluster_endpoint  # Endpoint of your EKS cluster
  cluster_ca_certificate = base64decode(var.cluster_certificate_authority_data)  # CA certificate of your EKS cluster
  token                  = data.aws_eks_cluster_auth.cluster_auth.token  # Auth token for Kubernetes
}

data "aws_eks_cluster" "nginx_cluster" {
  name = module.eks.cluster_name  # Output from eks module
 
}


data "aws_eks_cluster_auth" "cluster_auth" {
  name = data.aws_eks_cluster.nginx_cluster.name
}

resource "kubernetes_manifest" "argocd" {
  manifest = {
    apiVersion = "apps/v1"
    kind       = "Deployment"
    metadata = {
      name      = "argocd-server"
      namespace = "argocd"
    }
    spec = {
      replicas = 1
      selector = {
        matchLabels = {
          app = "argocd-server"
        }
      }
      template = {
        metadata = {
          labels = {
            app = "argocd-server"
          }
        }
        spec = {
          containers = [
            {
              name  = "argocd-server"
              image = "argoproj/argocd:v2.5.0"
              ports = [
                {
                  containerPort = 8080
                }
              ]
              env = [
                {
                  name  = "ARGOCD_SERVER"
                  value = "argocd-server"
                }
              ]
            }
          ]
        }
      }
    }
  }
}
