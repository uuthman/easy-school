resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

    tags = {
    Name = "server-${var.infra_env}-web-route-table"
    Project = var.project_name
    Environment = var.infra_env
  }
}