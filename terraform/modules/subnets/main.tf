resource "aws_subnet" "subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.subnet_cidr_block
  availability_zone = var.subnet_availability_zone

  tags = {
    Name = "server-${var.infra_env}-web-subnet"
    Project = var.project_name
    Environment = var.infra_env
  }
}