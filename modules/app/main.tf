# RT | Create a custom route table for the VPC and map the gw
resource "aws_route_table" "main_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.route_cidr_block
    gateway_id = var.gateway_id
  }

  tags = {
    Name = "poc-main-rt"
    Environment = var.environment
  }
}

# RT ASSOCIATION | Associate route table and subnet a
resource "aws_route_table_association" "subnet_a_ass" {
  subnet_id = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.main_rt.id
}

# RT ASSOCIATION | Associate route table and subnet b
resource "aws_route_table_association" "subnet_b_ass" {
  subnet_id = aws_subnet.subnet_b.id
  route_table_id = aws_route_table.main_rt.id
}

# SUBNET | Create a subnet within the vpc specifying cidr block and name tag
resource "aws_subnet" "subnet_a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_a_cidr_block
  availability_zone = var.subnet_a_az

  tags = {
    Name = "subnet-a"
    Environment = var.environment
  }
}

# SUBNET | Create another subnet within the vpc specifying cidr block and name tag
resource "aws_subnet" "subnet_b" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_b_cidr_block
  availability_zone = var.subnet_b_az 

  tags = {
    Name = "subnet-a"
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
    cidr_blocks = ["dev-vm-ip"]
  }

  # HTTP access from developer VM
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["dev-vm-ip"]
  }

  # HTTPS access form developer VM
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["dev-vm-ip"]
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

# KEY PAIR | Specifying key-pair and path
resource "aws_key_pair" "poc_user_key" {
  key_name = var.key_name
  public_key = file(var.public_key_path)

  tags = {
    Name = "poc-user-key"
    Environment = var.environment
  }
}

# EC2 INSTANCE | Create an instance in zone 2a
resource "aws_instance" "app_1" {
  instance_type = "t2.micro"

  ami = var.ami
  key_name = aws_key_pair.poc_user_key.id
  vpc_security_group_ids = [aws_security_group.developer_sg.id]
  subnet_id = aws_subnet.subnet_a.id
  associate_public_ip_address = "true"

  tags = {
    Name = "poc-app-1"
    Environment = var.environment
  }
}

# EC2 INSTANCE | Create an instance in zone 2b
resource "aws_instance" "app_2" {
  instance_type = "t2.micro"

  ami = var.ami
  key_name = aws_key_pair.poc_user_key.id
  vpc_security_group_ids = [aws_security_group.developer_sg.id]
  subnet_id = aws_subnet.subnet_b.id
  associate_public_ip_address = "true"

  tags = {
    Name = "poc-app-2"
    Environment = var.environment
  }
}
