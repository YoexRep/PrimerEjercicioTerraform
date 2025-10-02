#################### OUTPUTS ####################
output "lb_dns_name" {
  description = "DNS público del Load Balancer (haz clic para abrir en el navegador)."
  value       = "http://${aws_lb.loadbalancer_ps_1.dns_name}"
}



output "ec2_a_public_dns" {
  value = "http://${aws_instance.nginx-server_A_ps_1.public_dns }"
}

output "ec2_b_public_dns" {
  value = "http://${aws_instance.nginx-server_B_ps_1.public_dns }"
}