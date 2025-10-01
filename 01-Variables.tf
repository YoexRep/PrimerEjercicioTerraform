
#################### VARIABLES ####################
variable "region" {
  default = "us-east-1"
}

variable "environment" {
  description = "Entorno de desarollo"
  default     = "prueba"
  
}

variable "tipo_instancia" {
  description = "Tipo de instancia"
  default     = "t3.micro"
}

variable "nombre_proyecto" {
  description = "Nombre del proyecto"
  default     = "PrimerEjercicioSimulado"
}

