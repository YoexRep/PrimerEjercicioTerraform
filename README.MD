# Primer Ejercicio Simulado

Este proyecto contiene un ejercicio práctico utilizando **Terraform** para gestionar infraestructura como código.

## Estructura del Proyecto

- `main.tf`: Archivo principal de configuración de Terraform.
- `variables.tf`: Definición de variables utilizadas en el proyecto.
- `outputs.tf`: Salidas generadas tras la ejecución.
- `README.md`: Documentación del proyecto.

## Requisitos

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- Proveedor de nube configurado (por ejemplo, AWS, Azure, GCP)

## Uso

1. Clona el repositorio:
   ```bash
   git clone <url-del-repositorio>
   cd PrimerEjericioSimulado
   ```
2. Inicializa Terraform:
   ```bash
   terraform init
   ```
3. Previsualiza los cambios:
   ```bash
   terraform plan
   ```
4. Aplica la configuración:
   ```bash
   terraform apply
   ```

## Notas

- Personaliza las variables en `variables.tf` según tus necesidades.
- Revisa la documentación oficial de Terraform para más información.

## Licencia

Este proyecto se distribuye bajo la licencia MIT.
