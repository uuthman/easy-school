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
