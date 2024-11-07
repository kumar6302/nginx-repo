# nginx/iam.tf

resource "aws_iam_role" "argocd_service_account_role" {
  name = "argocd-service-account-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::${var.account_id}:oidc:idp/eks.amazonaws.com/id/${var.cluster_id}"  # Use var.cluster_id
        }
      }
    ]
  })
}
