provider "aws" {
    region = "eu-north-1"
  
}

variable "vpc_cidr" {
    description = "IP addresses for the VPC"
    type = string
    default = "10.0.0.0/16"
  
}


resource "aws_key_pair" "Keypair1" {
    key_name = "terraform-key-1"
    public_key = file("/Users/prakanda1/.ssh/id_rsa.pub")
  
}


resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidr

    tags = {
        Name = "vCloud1"
    }
  
}

resource "aws_subnet" "mysubnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "eu-north-1a"
    map_public_ip_on_launch = true

    tags = {
      Name = "MySubnet1"
    }
}


resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id
  
}


resource "aws_route_table" "RT" {
    vpc_id = aws_vpc.myvpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id

    }
}

resource "aws_route_table_association" "RT_association" {
    subnet_id = aws_subnet.mysubnet.id
    route_table_id = aws_route_table.RT.id 
}


resource "aws_security_group" "sg1" {
    name = "Web"       
    vpc_id = aws_vpc.myvpc.id

    ingress{
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress{
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "Web-sg"
    }
}

resource "aws_instance" "server"{
    ami = "ami-0705384c0b33c194c"
    instance_type = "t3.micro"
    key_name = aws_key_pair.Keypair1.key_name
    vpc_security_group_ids = [aws_security_group.sg1.id]
    subnet_id = aws_subnet.mysubnet.id

    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("/Users/prakanda1/.ssh/id_rsa")
      host = self.public_ip
    }

provisioner "file" {
    source = "app.py"
    destination = "/home/ubuntu/app.py"

}

provisioner "remote-exec" {
    inline = [
        "echo 'Hello from the remote server'",
        "sudo apt update -y",
        "sudo apt-get install -y python3-pip",
        "cd /home/ubuntu",
        "sudo apt install -y python3-flask",
        "sudo python3 app.py",
    ]

}
}