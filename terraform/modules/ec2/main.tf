resource "aws_instance" "ec2_slave_node" {
  ami           = var.instance_ami
  instance_type = var.instance_size
  associate_public_ip_address = true
  subnet_id = var.subnet_id
  security_groups = [var.security_group_id]


  root_block_device {
    volume_size = var.instance_root_device_size
    volume_type = "gp3"
  }

  tags = {
    Name = "server-${var.infra_env}-web-slave-node"
    Project = var.project_name
    Environment = var.infra_env
  }
}