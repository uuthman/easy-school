resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = var.vpc_id
  tags = {
    Name = "server-${var.infra_env}-web-internet-gateway"
    Project = var.project_name
    Environment = var.infra_env
  }
}