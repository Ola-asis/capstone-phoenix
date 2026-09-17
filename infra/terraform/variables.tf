variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "project_name" {
  type    = string
  default = "capstone-phoenix"
}

variable "my_ip" {
  type        = string
  description = "Public IP with /32 CIDR for admin access"
}

variable "key_name" {
  type    = string
  default = "capstone-key"
}

variable "instance_type" {
  type    = string
  default = "t3.small"
}
