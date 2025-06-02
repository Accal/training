provider "aws" {
  region = var.region
}

resource "aws_security_group" "ssh_access" {
  name        = "ssh-access"
  description = "Allow SSH access"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }
}

resource "aws_instance" "my_vm" {
  ami           = var.ami
  instance_type = "t3.micro"
  security_groups = ["ssh-access"]

  tags = {
    Name = "Lab Repair Server"
  }
}
