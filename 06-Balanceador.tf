#################### LOAD BALANCER ####################
resource "aws_lb" "loadbalancer_ps_1" {
  name               = "loadbalancer-ps-1"
  internal           = false # Public LB, si es true es privado, si es false es publico
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_group_loadbalancer_ps_1.id]
  subnets            = [aws_subnet.subnet_ps_public_a.id, aws_subnet.subnet_ps_public_b.id]
}


resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.loadbalancer_ps_1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.loadbalancer_target_group_ps_1.arn
  }
}

resource "aws_lb_target_group" "loadbalancer_target_group_ps_1" {
  name     = "loadbalancer-target-group-ps-1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_practica_simulada_1.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }
}

resource "aws_lb_target_group_attachment" "ec2_attachment_1" {
  target_group_arn = aws_lb_target_group.loadbalancer_target_group_ps_1.arn
  target_id        = aws_instance.nginx-server_A_ps_1.id 
  port             = 80
}

resource "aws_lb_target_group_attachment" "ec2_attachment_2" {
  target_group_arn = aws_lb_target_group.loadbalancer_target_group_ps_1.arn
  target_id        = aws_instance.nginx-server_B_ps_1.id
  port             = 80
}