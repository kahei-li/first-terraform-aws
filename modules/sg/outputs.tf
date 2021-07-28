# output for elb module
output "elb_sg_id" {
  description = "Outputing elastic load balancer security group id"
  value = aws_security_group.elb_sg.id
}

# output for app module
output "developer_sg_id" {
  description = "Outputing developer security group id"
  value = aws_security_group.developer_sg.id
}

output "vpc_internal_sg_id" {
  description = "Outputing vpc_internal security group id"
  value = aws_security_group.vpc_internal_sg.id
}