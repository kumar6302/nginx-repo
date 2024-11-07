resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx-service"
  }

  spec {
    selector = {
      app = "nginx"
    }
    port {
      port = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}
