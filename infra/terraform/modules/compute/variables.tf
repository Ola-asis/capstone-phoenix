variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "key_name" {
  type    = string
  default = "capstone-key"
}

variable "instance_type" {
  type    = string
  default = "t3.small"
}

variable "project_name" {
  type    = string
  default = "capstone-phoenix"
}
