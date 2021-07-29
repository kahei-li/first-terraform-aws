# SG | Create security group for elastic load-balancer so it is accessible via the web
resource "aws_security_group" "elb_sg" {
  name = "elb_access"
  description = "Used in the terraform"
  vpc_id = var.vpc_id

  # HTTP access forom anywhere
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.elb_ingress_cidr_http]
  }

  # Outbound internet access 
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "poc-elb-sg"
    Environment = var.environment
  }
}

# SG | Create a security group for developer access 
resource "aws_security_group" "developer_sg" {
  name = "developer_access"
  description = "Used in the terraform"
  vpc_id = var.vpc_id

  # SSH access from developer VM
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.developer_vm_cidr]
  }

  # HTTP access from developer VM
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.developer_vm_cidr]
  }

  # HTTPS access form developer VM
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [var.developer_vm_cidr]
  }

  # Outbound internet access
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "poc-developer-sg"
    Environment = var.environment
  }
}

# SG | Create a security group for VPC internal access 
resource "aws_security_group" "vpc_internal_sg" {
  name = "vpc_internal_access"
  description = "Used in the terraform"
  vpc_id = var.vpc_id

  # SSH access from internal VPC
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }

  # HTTP access from internal VPC
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }

  # HTTPS access from internal VPC
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }

    # MySQL access from internal VPC
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }
  
    # Memcached access from internal VPC
  ingress {
    from_port = 11211
    to_port = 11211
    protocol = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }

    # ICMP access from internal VPC
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = [var.vpc_cidr_block]
  }

  # Outbound internet access
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "poc-developer-sg"
    Environment = var.environment
  }
}