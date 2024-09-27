output "vpc_id" {
  description = "ID da VPC"
  value       = aws_vpc.main.id
}

output "subnet_1_id" {
  description = "ID da primeira Subnet"
  value       = aws_subnet.subnet_1.id
}

output "subnet_2_id" {
  description = "ID da segunda Subnet"
  value       = aws_subnet.subnet_2.id
}

output "subnet_3_id" {
  description = "ID da terceira Subnet"
  value       = aws_subnet.subnet_3.id
}