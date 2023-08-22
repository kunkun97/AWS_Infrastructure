output "vpc_id" {
  value = aws_vpc.vpc-devop.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
}
