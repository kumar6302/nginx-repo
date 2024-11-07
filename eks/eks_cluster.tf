# eks/eks_cluster.tf

resource "aws_eks_cluster" "nginx_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids         = var.subnet_ids
    vpc_id     = var.vpc_id
  }
}

resource "aws_eks_node_group" "nginx_node_group" {
  cluster_name    = aws_eks_cluster.nginx_cluster.name
  node_role_arn   = aws_iam_role.eks_worker_node_role.arn
  subnet_ids      = var.subnet_ids
  instance_types  = ["t3.medium"]

  scaling_config {
    desired_size = 2   # Specify the desired number of nodes
    min_size     = 1   # Specify the minimum number of nodes
    max_size     = 3   # Specify the maximum number of nodes
  }
}
