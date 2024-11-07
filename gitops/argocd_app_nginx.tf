resource "kubernetes_manifest" "nginx_app" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "nginx-app"
      namespace = "argocd"
    }
    spec = {
      destination = {
        namespace = "default"
        server    = "https://kubernetes.default.svc"
      }
      source = {
        repoURL = "https://github.com/kumar6302/nginx-repo.git"
        path    = "k8s/nginx"  # Path to the Kubernetes manifests for NGINX
        targetRevision = "HEAD"
      }
      project = "default"
    }
  }
}
