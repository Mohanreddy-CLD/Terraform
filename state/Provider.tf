terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.68" 
    }
  }
  
  backend "s3" {
    # CHANGE THIS to a globally unique bucket you have created in your AWS account
    bucket       = "ecom-terraform-state-unique-name-123" 
    key          = "provisioners"
    region       = "ap-south-1" 
    use_lockfile = true 
    encrypt      = true
  }
}

provider "aws" {
  region = "ap-south-1"
}