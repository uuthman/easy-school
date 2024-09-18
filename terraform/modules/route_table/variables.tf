variable "vpc_id" {
  description = "The ID of the VPC where the IG will be used"
  type        = string
}

variable "internet_gateway_id" {
  description = "The ID of the Internet gateway"
  type        = string
}

variable infra_env {
    description = "infrastructure environment"
    type = string
}

variable "project_name" {
  description = "Project name"
  type = string
}