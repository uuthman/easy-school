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


resource "aws_instance" "ec2_master_node" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_size
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.instance_root_device_size
    volume_type = "gp3"
  }

  tags = {
    Name = "server-web-master-node"
    Project = var.project_name

  }

  user_data = <<-EOF
    #!/bin/bash
    # Update the system
    sudo apt update -y

    # Install software-properties-common (if not already installed)
    sudo apt install software-properties-common -y

    # Add Ansible PPA repository
    sudo add-apt-repository --yes --update ppa:ansible/ansible

    # Install Ansible
    sudo apt install ansible -y
    EOF
}
