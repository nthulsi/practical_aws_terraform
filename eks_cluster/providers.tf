#url for creating eks cluster
#https://medium.com/devops-mojo/terraform-provision-amazon-eks-cluster-using-terraform-deploy-create-aws-eks-kubernetes-cluster-tf-4134ab22c594

terraform {
  required_version = ">= 1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
#provider name and region 
provider "aws" {
  region     = "ap-south-1"
  #access_key = "AKIA4PNPSPCJFINHAHVO"
  #secret_key = "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"
}
