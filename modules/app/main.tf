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
  vpc_security_group_ids = [var.developer_sg_id, var.vpc_internal_sg_id]
  subnet_id = var.subnet_a_id
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
  vpc_security_group_ids = [var.developer_sg_id, var.vpc_internal_sg_id]
  subnet_id = var.subnet_b_id
  associate_public_ip_address = "true"

  tags = {
    Name = "poc-app-2"
    Environment = var.environment
  }
}
