# Criar a VPC
resource "aws_vpc" "main" {
  description = "VPC para os serviços da aplicação fastfodd"
  cidr_block = var.vpc_cidr
  tags = {
    Name = "fastfood-vpc"
  }
}

# Criar as Subnets
resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_1_cidr
  availability_zone = var.availability_zone_1
  tags = {
    Name = "subnet-1"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_2_cidr
  availability_zone = var.availability_zone_2
  tags = {
    Name = "subnet-2"
  }
}

resource "aws_subnet" "subnet_3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_3_cidr
  availability_zone = var.availability_zone_3
  tags = {
    Name = "subnet-3"
  }
}