# output for elb module > instances
output "instances_ids" {
  description = "Outputing app instances id requiring elb balancing"
  value = [aws_instance.app_1.id, aws_instance.app_2.id]
}

output "instances_public_ips" {
  description = "Public IP address of the EC2 instances"
  value       = [aws_instance.app_1.public_ip, aws_instance.app_2.public_ip]
}

# output for elb module > instances
output "subnets_ids" {
  description = "Outputing app instances id requiring elb balancing"
  value = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
}