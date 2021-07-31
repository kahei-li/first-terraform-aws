# ELB | Create an elastic application load-balancer
resource "aws_lb" "app_elb" {
  name = "app-elb"
  internal = false
  subnets = [var.subnet_a_id, var.subnet_b_id]
  security_groups = [var.elb_sg_id]
  enable_deletion_protection = false
  # instances = [var.instance_1_id, var.instance_2_id]

  # access_logs {
  #   bucket = 
  #   prefix = ""
  #   enabled = false
  # }

  tags = {
    Name = "app-elb"
    Environment = var.environment
  }
}

# TARGET GROUP | Create a target group expecting port 80 traffic
resource "aws_lb_target_group" "app_lb_target_group_http" {
  name = "app-lb-target-group-http"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id

  tags = {
    Name = "app-lb-target-group-http"
    Environment = var.environment
  }
}

# aws_lb_target_group_attachement is in the app module

# LISTENER | Create a HTTP listener
resource "aws_lb_listener" "app_lb_listener_http" {
  load_balancer_arn = aws_lb.app_elb.arn
  port = "80"
  protocol = "HTTP"
  # ssl_policy = ""
  # certificate_arn = ""

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.app_lb_target_group_http.arn
  }
}

# -------HTTPS and Cert not yet implemented----------------
# LISTENER | Create a HTTPS listener
# resource "aws_lb_listener" "app_lb_listener_https" {
#   load_balancer_arn = aws_lb.app_elb.arn
#   port = "443"
#   protocol = "HTTPS"
#   ssl_policy = ""
#   certificate_arn = ""

#   default_action {
#     type = "forward"
#     target_group_arn = aws_lb_target_group.app_lb_target_group_http.arn
#   }
# }

# # ELB listener rule - forward and host weighting 50:50 
# resource "aws_lb_listener_rule" "host_based_routing_http" {
#   listener_arn = aws_lb_listener.app_lb_listener_http.arn
#   priority = 99

#   action {
#     type = "forward"
#     forward {
#       target_group {
#         arn = aws_lb_target_group.app_lb_target_group_http.arn
#         weight = 50
#       }

#       target_group {
#         arn = aws_lb_target_group.app_lb_target_group_http.arn
#         weight = 50
#       }

#       stickiness {
#         enabled = true
#         duration = 600
#       }
#     }
#   }
#   condition {
#     host_header {
#      values = [""]
#    }
#  }
# }

# resource "aws_lb_listener_certificate" "" {
#   listener_arn = ""
#   certificate_arn = ""
# }

# resource "aws_acm_certificate" "cert" {
#   domain_name = "example.com"
#   validation_method = "DNS"

#   tags = {
#     Environment = var.environment
#   }
# }