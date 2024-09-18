variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type = string
}


variable infra_env {
    description = "infrastructure environment"
    type = string
}