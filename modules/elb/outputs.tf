# Output target_group_arn for other modules to access and attach resource to
output "app_lb_target_group_http_arn" {
    description = "Output app target group arn for app to attach instances to"
    value = aws_lb_target_group.app_lb_target_group_http.arn
}