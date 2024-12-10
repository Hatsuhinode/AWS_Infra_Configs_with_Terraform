variable "aws_region" {
    description = "Region to deploy and manage AWS resources"
    type = string
    default = "eu-north-1"
  
}


variable "myvpc_cidr" {
    description = "Range of IP addresses for the VPC"
    type = string
    default = "10.0.0.0/16"
  
}


variable "myvpc_name" {
    description = "Name of VPC to be created"
    type = string
    default = "MyVPC1"
  
}


variable "mysubnet_cidr" {
    description = "Range of IP addresses for the subnet"
    type = string
    default = "10.0.0.0/24"
  
}


variable "mysubnet_availabilityZone" {
    description = "Availability zone for creating subnet"
    type = string
    default = "eu-north-1a"

  
}


variable "mysubnet_name" {
    description = "Name of VPC to be created"
    type = string
    default = "MySubnet1"
  
}


variable "igw_name" {
    description = "Name for the internet gateway attached to the VPC"
    type = string
    default = "MyIGW1"
  
}


variable "destination_cidr" {
    description = "Destination CIDR block for the route used for directing traffic intended for the internet from within the VPC"
    type = string
    default = "0.0.0.0/0"
  
}


variable "ami_type" {
    description = "Amazon Machine Image(AMI) type"
    type = string
    default = "ami-0705384c0b33c194c"
  
}


variable "ec2Instance_type" {
    description = "Instance type"
    type = string
    default = "t3.micro"
    
}
  
