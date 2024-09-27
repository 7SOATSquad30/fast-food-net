variable "availability_zone_1" {
  description = "Zona de disponibilidade para a primeira Subnet"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_2" {
  description = "Zona de disponibilidade para a segunda Subnet"
  type        = string
  default     = "us-east-1b"
}

variable "availability_zone_3" {
  description = "Zona de disponibilidade para a terceira Subnet"
  type        = string
  default     = "us-east-1c"
}

variable "vpc_cidr" {
  description = "CIDR block da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_1_cidr" {
  description = "CIDR block da primeira Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_2_cidr" {
  description = "CIDR block da segunda Subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "subnet_3_cidr" {
  description = "CIDR block da terceira Subnet"
  type        = string
  default     = "10.0.3.0/24"
}