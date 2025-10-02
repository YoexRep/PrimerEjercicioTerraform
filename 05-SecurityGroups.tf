#################### SECURITY GROUP ####################
# Security Group del Load Balancer
resource "aws_security_group" "security_group_loadbalancer_ps_1" {
  vpc_id      = aws_vpc.vpc_practica_simulada_1.id
  name        = "security_group_lb_ps_1"
  description = "Permite trafico HTTP al load balancer"

  
    #Permitir trafico HTTP y HTTPS desde cualquier parte
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


# Permitir todo el trafico de salida
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group de las instancias
resource "aws_security_group" "security_group_intances_ps_1" {
  vpc_id      = aws_vpc.vpc_practica_simulada_1.id
  name        = "security_group_intances_ps_1"
  description = "Permite trafico HTTP solo desde el Laod Balancer y SSH desde cualquier parte"

 ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"] #-- Aqui deberia ir mi ip por seguridad, pero por simplicidad lo dejo asi
}
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.security_group_loadbalancer_ps_1.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}