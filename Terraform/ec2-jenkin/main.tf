provider "aws" {
  region = var.region
}

resource "aws_security_group" "ec2_jenkin_sg" {
  name_prefix = "EC2JenkinSG"
  description = "Allow access on ports 8080 and 22"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_jenkin_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [
    aws_security_group.ec2_jenkin_sg.id,
  ]
  key_name = var.key_name
  tags = {
    Name = "EC2JenkinInstance"
  }
  associate_public_ip_address = var.enabled
}
