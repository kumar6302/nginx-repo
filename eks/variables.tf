variable "vpc_id" {
  description = "VPC ID for the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}
variable "aws_eks_cluster" {
  description = "EKS cluster information"
  type        =  string  # Or specify the type according to your needs
}
