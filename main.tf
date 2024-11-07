provider "aws" {
  region = var.region
}

# VPC module does not need vpc_id, as it's being created here
module "vpc" {
  source = "./vpc"
  region = var.region  # Add this line to pass the region
  vpc_id = var.vpc_id  # Pass the vpc_id as an argument
}

module "eks" {
  source     = "./eks"
  vpc_id     = module.vpc.vpc_id  # Pass the vpc_id from the VPC module to the EKS module
  subnet_ids = module.vpc.subnet_ids
  region     = var.region
  cluster_name = "nginx-cluster"  # Provide a name for your EKS cluster
  aws_eks_cluster = "nginx-cluster"  # Pass the cluster name here if required by the module
}

module "nginx" {
  source        = "./nginx"
  region        = var.region
  cluster_name  = module.eks.cluster_name
  cluster_endpoint   = module.eks.cluster_endpoint  # Pass the endpoint
  cluster_certificate_authority_data = module.eks.cluster_certificate_authority_data  # Pass the CA data
  account_id    = var.account_id
  cluster_id    = module.eks.cluster_id
}
