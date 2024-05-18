output "public-ip-address" {
    value = aws_instance.ec2Instance1.public_ip 
  
}