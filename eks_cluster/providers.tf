#url for creating eks cluster
#https://medium.com/devops-mojo/terraform-provision-amazon-eks-cluster-using-terraform-deploy-create-aws-eks-kubernetes-cluster-tf-4134ab22c594

terraform {
  required_version = ">= 1.1.0"
  backend "s3" {
    bucket = "dhanapal_eks_storage"
    key    = "terraform/state"
    region         = "ap-south-1"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
#provider name and region 
provider "aws" {
  region = "ap-south-1"
}
