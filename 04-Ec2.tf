#################### AMI LOOKUP ####################
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

####### ssh de los servidor ####### 
# ssh-keygen -t rsa -b 2048 -f "nginx-server.key"

resource "aws_key_pair" "nginx-server-ssh" {
  key_name   = "nginx-server-ssh"
  public_key = file("nginx-server.key.pub")

  tags = {
    Name        = "nginx-server-ssh"
    Environment = var.environment
    Owner       = "yoel.tm94@gmail.com"
    Team        = "DevOps"
    Project     = var.nombre_proyecto
  }
}



####### EC2 Instance A #######
resource "aws_instance" "nginx-server_A_ps_1" {
    ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = var.tipo_instancia

  subnet_id              = aws_subnet.subnet_ps_public_a.id 
  vpc_security_group_ids = [aws_security_group.security_group_intances_ps_1.id]
  associate_public_ip_address = true


  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
               echo "<h1>Servidor de nginx subnet A</h1>" > /usr/share/nginx/html/index.html
              EOF

  key_name = aws_key_pair.nginx-server-ssh.key_name


  tags = {
    Name        = "nginx-server-A-ps-1"
    Environment = var.environment
    Owner       = "yoel.tm94@gmail.com"
    Team        = "DevOps"
    Project     = var.nombre_proyecto
  }
}



####### EC2 Instance B #######
resource "aws_instance" "nginx-server_B_ps_1" {
    ami           = data.aws_ami.latest_amazon_linux.id     
    instance_type = var.tipo_instancia  

  subnet_id              = aws_subnet.subnet_ps_public_b.id 
  vpc_security_group_ids = [aws_security_group.security_group_intances_ps_1.id]
  associate_public_ip_address = true


  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              echo "<h1>Servidor de nginx subnet B</h1>" > /usr/share/nginx/html/index.html
              EOF

  key_name = aws_key_pair.nginx-server-ssh.key_name


  tags = {
    Name        = "nginx-server-B-ps-1"
    Environment = var.environment
    Owner       = "yoel.tm94@gmail.com"
    Team        = "DevOps"
    Project     = var.nombre_proyecto
  }
}

