provider "aws" {
    region = "eu-north-1"
  
}

module "ec2_instance" {
    source = "./modules/ec2Instance"
    ami_value = "ami-0705384c0b33c194c"
    instance_type_value = "t3.micro"
    subnet_id_value = "subnet-028acbe684778b21a"  
}