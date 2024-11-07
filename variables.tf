variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
}


variable "account_id" {
  description = "AWS Account ID"
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  default     = "nginx-cluster"
}
variable "vpc_id" {
  type = string
  description = "The VPC ID where EKS will be deployed"
}

variable "subnet_ids" {
  type = list(string)
  description = "List of subnet IDs for EKS cluster and nodes"
}

variable "aws_eks_cluster" {
  description = "EKS cluster details"
  type        = string
}
