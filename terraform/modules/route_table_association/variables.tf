variable "route_table_id" {
  description = "This is the id for the route table"
  type = string
}

variable "subnet_id" {
  description = "This is the id for the first subnet"
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
