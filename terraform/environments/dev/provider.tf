terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "easy-school-backend"
    key    = "multi-environments/dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.default_region
}