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
    cidr_blocks = ["0.0.0.0/0"]
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

# ELB | Create an elastic load-balancer
resource "aws_elb" "app_elb" {
  name = "terraform-example-elb"
  
  subnets = [tostring(element(var.subnets_ids,1)), tostring(element(var.subnets_ids,2))]
  security_groups = [aws_security_group.elb_sg.id]
  instances = [tostring(element(var.instances_ids,1)), tostring(element(var.instances_ids,2))]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  #   listener {
  #   instance_port = 443
  #   instance_protocol = "https"
  #   lb_port = 443
  #   lb_protocol = "https"
  #   ssl_certificate_id = "not-yet-available"
  # }

  tags = {
    Name = "poc-app-elb"
    Environment = var.environment
  }
}