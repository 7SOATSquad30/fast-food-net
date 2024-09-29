provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "aws-fastfood-terraform-tfstate"
    key    = "fast-food-net/terraform.tfstate"
    region = "us-east-1"
  }
}

# Criar a VPC
resource "aws_vpc" "main" {
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

resource "aws_subnet" "subnet_4_public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_4_public_cidr
  availability_zone = var.availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-4-public"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet-gateway"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_subnet_assoc" {
  subnet_id      = aws_subnet.subnet_4_public.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.subnet_4_public.id

  tags = {
    Name = "nat-gateway"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id  = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private_subnet_1_assoc" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_2_assoc" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_3_assoc" {
  subnet_id      = aws_subnet.subnet_3.id
  route_table_id = aws_route_table.private_route_table.id
}
