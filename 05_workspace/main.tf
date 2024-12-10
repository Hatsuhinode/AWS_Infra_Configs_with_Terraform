/*provider "aws" {
    region = "eu-north-1"
  
}

variable "ami_type" {
    description = "Amazon Machine Image"
    type = string
  
}

variable "instance_type_value" {
    description = "Instance type"
    type = string
  
}*/

module "derive-Instance" {
    source = "./modules/ec2_instance"
    ami_type = var.ami_type1
    instance_type_value = var.instance_type_value1
}