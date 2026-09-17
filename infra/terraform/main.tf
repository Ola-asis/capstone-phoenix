terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "capstone-phoenix-tfstate-591316257459"
    key            = "capstone-phoenix/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "capstone-phoenix-tflocks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source       = "./modules/network"
  project_name = var.project_name
}

module "security_group" {
  source       = "./modules/security_group"
  vpc_id       = module.network.vpc_id
  vpc_cidr     = module.network.vpc_cidr
  my_ip        = var.my_ip
  project_name = var.project_name
}

module "compute" {
  source            = "./modules/compute"
  subnet_id         = module.network.subnet_id
  security_group_id = module.security_group.security_group_id
  key_name          = var.key_name
  instance_type     = var.instance_type
  project_name      = var.project_name
}
