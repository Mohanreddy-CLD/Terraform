terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.68.0" # Constrains to the latest stable minor updates
    }
  }
}

provider "aws" {
  region = "ap-south-1" # Mumbai Region
}
