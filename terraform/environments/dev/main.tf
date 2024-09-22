data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["099720109477"] # Canonical official
}


module "vpc" {
  source       = "./../../modules/vpc"
  vpc_cidr     = var.vpc_cidr
  infra_env    = var.infra_env
  project_name = var.project_name
}

module "subnet" {
  source                   = "./../../modules/subnets"
  vpc_id                   = module.vpc.vpc_id
  subnet_cidr_block        = var.subnet_cidr_block
  subnet_availability_zone = var.subnet_availability_zone
  infra_env                = var.infra_env
  project_name             = var.project_name
}

module "internet_gateway" {
  source       = "./../../modules/internet_gateway"
  vpc_id       = module.vpc.vpc_id
  infra_env    = var.infra_env
  project_name = var.project_name
}

module "route_table" {
  source              = "./../../modules/route_table"
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.ig_id
  infra_env           = var.infra_env
  project_name        = var.project_name
}

module "route_table_association" {
  source         = "./../../modules/route_table_association"
  route_table_id = module.route_table.route_table_id
  subnet_id      = module.subnet.subnet_id
  infra_env      = var.infra_env
  project_name   = var.project_name
}

module "security_group" {
  source       = "./../../modules/security_group"
  vpc_id       = module.vpc.vpc_id
  infra_env    = var.infra_env
  project_name = var.project_name
}

module "ec2" {
  source            = "./../../modules/ec2"
  instance_ami      = data.aws_ami.ubuntu.id
  instance_size     = var.instance_size
  infra_env         = var.infra_env
  project_name      = var.project_name
  subnet_id         = module.subnet.subnet_id
  security_group_id = module.security_group.sg_id
}

output "dev_ec2_public_ip" {
  value       = module.ec2.public_ip
  description = "Public IP of the dev EC2 instance"
}