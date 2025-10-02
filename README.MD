# Primer Ejercicio Simulado

Este proyecto contiene un ejercicio práctico utilizando **Terraform** para gestionar infraestructura como código.

Este ejercicio fue dado por chat gtp como un simulador de tarea

Se requeria que se configurara lo siguiente:

### 📌 Requerimientos

1. **Red (VPC & Subredes)**
   - Crea una **VPC propia** (no uses la default).
   - Dentro de esa VPC, define **dos subnets públicas** en distintas **AZs**.
   - Configura una **Internet Gateway** para que las instancias tengan salida a internet.
   - Configura una **Route Table** para esas subnets.
2. **Instancias EC2 (servidores web)**
   - Debes crear **dos instancias EC2** (tipo `t2.micro`), cada una en una subnet diferente.
   - Ambas instancias deben tener instalado **nginx** automáticamente (con `user_data`).
   - Configúralas para aceptar tráfico en los puertos **22 (SSH)** y **80 (HTTP)**.
3. **Balanceador de carga (ELB clásico o ALB)**
   - Coloca un **Load Balancer** al frente de las dos instancias, de manera que se reparta el tráfico HTTP (puerto 80).
   - El balanceador debe estar asociado a las dos subnets.
4. **Outputs**
   - El código debe mostrar como output la **IP pública del Load Balancer**, para que podamos probar la aplicación en el navegador.
