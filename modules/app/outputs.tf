# output for elb module > instances
output "instance_1_id" {
  description = "Outputing app instance 1 id requiring elb balancing"
  value = aws_instance.app_1.id
}

output "instance_2_id" {
  description = "Outputing app instance 2 id requiring elb balancing"
  value = aws_instance.app_2.id
}