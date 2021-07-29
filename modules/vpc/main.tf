# VPC | Creating a VPC specifying cidr block and name tag
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "poc-main-vpc"
    Environment = var.environment
  }
}

# IG | Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "main_gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "poc-main-gw"
    Environment = var.environment
  }
}

# RT | Create a custom route table for the VPC and map the gw
resource "aws_route_table" "main_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = var.route_cidr_block
    gateway_id = aws_internet_gateway.main_gw.id
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
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_a_cidr_block
  availability_zone = var.subnet_a_az

  tags = {
    Name = "subnet-a"
    Environment = var.environment
  }
}

# SUBNET | Create another subnet within the vpc specifying cidr block and name tag
resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_b_cidr_block
  availability_zone = var.subnet_b_az 

  tags = {
    Name = "subnet-b"
    Environment = var.environment
  }
}
