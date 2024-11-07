resource "aws_iam_role" "argocd_k8s_role" {
  name = "argocd-k8s-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "argocd_k8s_cluster_policy_attachment" {
  role       = aws_iam_role.argocd_k8s_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "argocd_k8s_policy_attachment" {
  role       = aws_iam_role.argocd_k8s_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFullAccess"
}
