# EC2 INSTANCE | Create an instance in zone 2a    # Use key user_keypair specified in root and created in app module
resource "aws_instance" "api_1" {
  instance_type = "t2.micro"

  ami = var.ami
  key_name = var.key_name
  vpc_security_group_ids = [var.developer_sg_id, var.vpc_internal_sg_id]
  subnet_id = var.subnet_a_id
  associate_public_ip_address = "true"

  tags = {
    Name = "poc-api-1"
    Environment = var.environment
  }
}

# EC2 INSTANCE | Create an instance in zone 2b
resource "aws_instance" "api_2" {
  instance_type = "t2.micro"

  ami = var.ami
  key_name = var.key_name
  vpc_security_group_ids = [var.developer_sg_id, var.vpc_internal_sg_id]
  subnet_id = var.subnet_b_id
  associate_public_ip_address = "true"

  tags = {
    Name = "poc-api-2"
    Environment = var.environment
  }
}

# resource "aws_lb_target_group_attachment" "api_lb_target_group_attachment_1" {
#   target_group_arn = var.api_lb_target_group_http_arn
#   target_id = aws_instance.app_1.id
#   port = 80
# }

# resource "aws_lb_target_group_attachment" "api_lb_target_group_attachment_2" {
#   target_group_arn = var.api_lb_target_group_http_arn
#   target_id = aws_instance.app_2.id
#   port = 80
# }
