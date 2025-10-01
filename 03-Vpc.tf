#################### VPC ####################
resource "aws_vpc" "vpc_practica_simulada_1" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
    
    tags = {
    Name        = "vpc-practica-simulado"
    Environment = var.environment
    Owner       = "yoel.tm94@gmail.com"
    Team        = "DevOps"
    Project     = var.nombre_proyecto
  }
}

resource "aws_internet_gateway" "internetgateway_ps_1" {
  vpc_id = aws_vpc.vpc_practica_simulada_1.id
}

resource "aws_route_table" "routetable_ps_1" {
  vpc_id = aws_vpc.vpc_practica_simulada_1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetgateway_ps_1.id
  }
}

resource "aws_subnet" "subnet_ps_public_a" {
  vpc_id                  = aws_vpc.vpc_practica_simulada_1.id
  cidr_block              = "10.0.10.0/24"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true
 
  tags = {
    Name        = "subnet-public-a"
    Environment = var.environment
    Owner       = "yoel.tm94@gmail.com"
    Team        = "DevOps"
    Project     = var.nombre_proyecto
  }
}

resource "aws_subnet" "subnet_ps_public_b" {
  vpc_id                  = aws_vpc.vpc_practica_simulada_1.id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true
   tags = {
    Name        = "subnet-public-b"
    Environment = var.environment
    Owner       = "yoel.tm94@gmail.com"
    Team        = "DevOps"
    Project     = var.nombre_proyecto
  }
}

resource "aws_route_table_association" "associacion_a" {
  subnet_id      = aws_subnet.subnet_ps_public_a.id
  route_table_id = aws_route_table.routetable_ps_1.id
}

resource "aws_route_table_association" "associacion_b" {
  subnet_id      = aws_subnet.subnet_ps_public_b.id
  route_table_id = aws_route_table.routetable_ps_1.id
}