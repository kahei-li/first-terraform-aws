# ELB | Create an elastic load-balancer
resource "aws_elb" "app_elb" {
  name = "terraform-example-elb"
  
  subnets = [var.subnet_a_id, var.subnet_b_id]
  security_groups = [var.elb_sg_id]
  instances = [var.instance_1_id, var.instance_2_id]

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