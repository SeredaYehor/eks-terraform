output "private_first_subnet_id" {
  value = aws_subnet.private_first_subnet.id
}

output "private_second_subnet_id" {
  value = aws_subnet.private_second_subnet.id
}

output "public_first_subnet_id" {
  value = aws_subnet.public_first_subnet.id
}

output "public_second_subnet_id" {
  value = aws_subnet.public_second_subnet.id
}

output "vpc_id" {
  value = aws_vpc.redmine_vpc.id
}
