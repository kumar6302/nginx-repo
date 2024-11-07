# nginx/ecr.tf
resource "aws_ecr_repository" "nginx_repo" {
  name                 = "nginx-repository"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "repository_url" {
  value = aws_ecr_repository.nginx_repo.repository_url
}
