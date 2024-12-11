provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "my_instance" {
  ami                   ="ami-0453ec754f44f9a4a"
  instance_type          = "t2.micro"
  count                  = 1
  key_name               = "LAVANYA"
  associate_public_ip_address = true
  user_data              = file("data.sh")
  tags = {
    Name = "My public Instance 1"
  }
}
resource "aws_security_group" "demosg" {
name = "demosg"
description = "Security group for Wordpress and MySQL"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    from_port=443
    to_port=443
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
   from_port=22
   to_port=22
   protocol="tcp"
   cidr_blocks=["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
