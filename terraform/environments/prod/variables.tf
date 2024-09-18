variable default_region {
    type = string
    description = "the region this infrastructure is in"
}

variable "vpc_cidr" {
  description = "The CIDR for the vpc"
  type = string
}
variable infra_env {
    description = "infrastructure environment"
    type = string
}

variable "project_name" {
  description = "Project name"
  type = string
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "subnet_availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
}

variable instance_size {
    type = string
    description = "ec2 web server size"
}