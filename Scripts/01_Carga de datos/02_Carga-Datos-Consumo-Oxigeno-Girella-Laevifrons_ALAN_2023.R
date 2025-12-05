#DETALLE DEL SCRIPT

# El presente script nos permitirá descargar los datos correspondientes al ensayo realizado durante el mes de Junio del año 2023, sobre los organismos juveniles de Girella laevifrons bajo las condiciones experimentales descritas y detalladas en el archivo "README.md"
# Los datos deben ser cargados desde mi carpeta "Data" dentro del repositorio "ALAN". 
# La explicación de cada función fue detallada en el archivo "01_Carga-Datos-Crecimiento-Girella-laevifrons_ALAN_2023.R" de la carpeta "Scripts"
# Cada script de carga de datos corresponde sólo al dataset de 1 variable. El presente corresponde a la carga de datos de "Consumo de Oxígeno".

# 1. Descarga de paquetes -------------------------------------
install.packages("readr")

# 2. Cargar librería ------------------------------------------
library(readr)

# 3. Lectura del archivo .csv desde Github  
datos_consumo_oxigeno <- "https://raw.githubusercontent.com/ValentinaGalazG/ALAN/refs/heads/main/Data/consumo-de-oxigeno-database-2023_Girella-laevifrons.csv" 
consumo_oxigeno <- read_csv2(datos_consumo_oxigeno) 

# 4. Verificación de carga de datos
str(consumo_oxigeno)
head(consumo_oxigeno) 
