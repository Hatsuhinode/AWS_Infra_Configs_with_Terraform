provider "aws" {
    region = "eu-north-1"
  
}

resource "aws_instance" "Instance1"{
    ami = "ami-0705384c0b33c194c"
    instance_type = "t3.micro"
    key_name = "Instance-KV-1"
    subnet_id = "subnet-028acbe684778b21a"
  
}

resource "aws_s3_bucket" "s3_buck" {
    bucket = "prakanda-s3-remotebackend-state"
  
}