output "jenkins_docker_public_ip" {
  value = aws_instance.ec2_jenkin_instance.public_ip
}