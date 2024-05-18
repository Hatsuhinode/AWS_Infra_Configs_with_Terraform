variable "ami_value" {
    description = "Amazon Machine Image for instance"
    type = string
    default = "a"
  
}

variable "instance_type_value" {
    description = "Instance type selection"
    type = string
    default = "t3.micro"
  
}


variable "subnet_id_value" {
    description = "Subnet selection"
    type = string
    default = "a"
  
}