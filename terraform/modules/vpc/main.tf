resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true

  tags = {
    Name = "server-${var.infra_env}-web-vpc"
    Project = var.project_name
    Environment = var.infra_env
  }
}