variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "my_ip" {
  type        = string
  description = "Public IP with /32 CIDR"
}

variable "project_name" {
  type    = string
  default = "capstone-phoenix"
}
