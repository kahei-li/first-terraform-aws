# Output for vpc id
output "vpc_id" {
    description = "outputing vpc_id up to root module to be interpolated"
    value = aws_vpc.main_vpc.id
}

# Output for vpc cidr block
output "vpc_cidr_block" {
    description = "outputing vpc_cidr_block up to root module to be interpolated"
    value = aws_vpc.main_vpc.cidr_block
}

# Output for subnet a id
output "subnet_a_id" {
    description = "outputing subnet_a_id up to root module to be interpolated"
    value = aws_subnet.subnet_a.id
}

# Output for subnet b id
output "subnet_b_id" {
    description = "outputing subnet_b_id up to root module to be interpolated"
    value = aws_subnet.subnet_b.id
}