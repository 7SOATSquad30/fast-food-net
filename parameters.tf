# Armazenar o ID da VPC no Parameter Store
resource "aws_ssm_parameter" "vpc" {
  name  = "/rds/vpc"
  type  = "String"
  value = aws_vpc.main.id
}

# Armazenar os IDs das Subnets no Parameter Store
resource "aws_ssm_parameter" "subnet_1" {
  name  = "/rds/subnet_1"
  type  = "String"
  value = aws_subnet.subnet_1.id
}

resource "aws_ssm_parameter" "subnet_2" {
  name  = "/rds/subnet_2"
  type  = "String"
  value = aws_subnet.subnet_2.id
}

resource "aws_ssm_parameter" "subnet_3" {
  name  = "/rds/subnet_3"
  type  = "String"
  value = aws_subnet.subnet_3.id
}

resource "aws_ssm_parameter" "cluster_security_group" {
  name  = "default"
  type  = "String"
  value = aws_security_group.cluster_security_group.id
}