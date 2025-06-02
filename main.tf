terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region     = "us-west-2"
  access_key = "access_key_ID"
  secret_key = "AWS_SECRET_ACCESS_KEY"
}
resource "aws_instance" "one" {
count = 5
ami = "ami-024790dfd513f7950"
instance_type = "t2.medium"
key_name = "Netflix"
vpc_security_group_ids = ["sgr-03b1c34e8712e0906"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "nexus", "AppServer-1", "AppServer-2", "Monitoring server"]
}
