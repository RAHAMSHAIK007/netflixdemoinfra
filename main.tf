provider "aws" {
region = "us-west-1"
}

resource "aws_instance" "abc" {
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
