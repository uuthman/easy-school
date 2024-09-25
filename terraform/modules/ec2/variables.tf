variable instance_size {
    type = string
    description = "ec2 web server size"
}

variable instance_ami {
    type = string
    description = "Server image to use"
}

variable instance_root_device_size {
    type = number
    description = "Root bock device size in GB"
    default = 30
}

variable infra_env {
    description = "infrastructure environment"
    type = string
}

variable "project_name" {
  description = "Project name"
  type = string
}

variable "subnet_id" {
    description = "id of the subnet"
    type = string
}

variable "security_group_id" {
    description = "id of the sg"
    type = string
}