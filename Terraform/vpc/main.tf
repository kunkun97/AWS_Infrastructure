provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpc-devop" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = var.enabled
  tags = {
    Name: "vpc-devops"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc-devop.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.availability_zone
  map_public_ip_on_launch = var.enabled
  tags = {
    Name: "subnet-devops"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.vpc-devop.id
  cidr_block        = var.public_subnet_cidr_2
  availability_zone = var.availability_zone_2
  map_public_ip_on_launch = var.enabled
  tags = {
    Name: "subnet-devops"
  }
}

resource "aws_internet_gateway" "igw-devops" {
  vpc_id = aws_vpc.vpc-devop.id
  tags = {
    Name: "igw-devops"
  }
}

resource "aws_route_table" "rtb-devops" {
  vpc_id = aws_vpc.vpc-devop.id
  tags = {
    Name: "rtb-devops"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-devops.id
  }
}

resource "aws_route" "route-devops" {
  route_table_id = aws_route_table.rtb-devops.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw-devops.id

  depends_on = [ aws_route_table.rtb-devops ]
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rtb-devops.id
}

resource "aws_route_table_association" "public_subnet_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.rtb-devops.id
}
