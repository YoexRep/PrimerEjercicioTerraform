#################### OUTPUTS ####################
output "lb_dns_name" {
  description = "DNS público del Load Balancer (haz clic para abrir en el navegador)."
  value       = "http://${aws_lb.loadbalancer_ps_1.dns_name}"
}
