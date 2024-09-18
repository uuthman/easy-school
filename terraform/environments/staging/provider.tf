terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.67.0"
    }
  }

  backend "s3" {
    bucket = "easy-school-backend"
    key    = "multi-environments/staging/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.default_region
  version = "5.67.0"
}