resource "aws_instance" "Inst1" {
    ami = var.ami_type
    instance_type = var.instance_type_value
  
}