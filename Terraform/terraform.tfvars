region          = "ap-southeast-1"
ami             = "ami-0acb5e61d5d7b19c8"
instance_type   = "t3.micro"
key_name        = "ec2-keypair"

# VPC details
vpc_cidr                   = "10.0.0.0/16"
public_subnet_cidr         = "10.0.1.0/24"
availability_zone          = "ap-southeast-1a"
public_subnet_cidr_2       = "10.0.2.0/24"
availability_zone_2  = "ap-southeast-1b"

# ECR details
backend_repo_name = "sd5130/backend"
frontend_repo_name = "sd5130/frontend"

# EKS details
eks_cluster_name = "eks-cluster-devops"
