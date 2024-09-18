terraform {

  required_version = "1.9.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }
  }

  backend "s3" {
    bucket = "easy-school-backend"
    key    = "multi-environments/prod/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.default_region
}