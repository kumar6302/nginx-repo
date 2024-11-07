# nginx/variables.tf

variable "region" {
  type        = string
  description = "The AWS region for the deployment."
}

variable "cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  type        = string
}

variable "cluster_certificate_authority_data" {
  description = "The certificate authority data for the EKS cluster"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "account_id" {
  type        = string
  description = "The AWS account ID for ECR and other resources."
}

# nginx/variables.tf

variable "cluster_id" {
  type        = string
  description = "EKS Cluster ID for IAM Role trust relationship"
}
variable "aws_eks_cluster" {
  description = "EKS cluster details"
  type        = string
}