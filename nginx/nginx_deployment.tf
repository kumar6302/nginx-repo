resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx-deployment"
    namespace = "default"
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "${aws_ecr_repository.nginx_repo.repository_url}:latest"  # Updated to use aws_ecr_repository directly
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

output "nginx_deployment_name" {
  value = kubernetes_deployment.nginx.metadata[0].name
}
