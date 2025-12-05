#DETALLE DEL SCRIPT (LEER)

# El presente script nos permitirá descargar los datos correspondientes al ensayo realizado durante el mes de Junio del año 2023, sobre los organismos juveniles de Girella laevifrons bajo las condiciones experimentales descritas y detalladas en el archivo "README.md"
# En la sección #1 se debe descargar e instalar el paquete de R que nos permitirá leer archivos ".csv"
# En la sección #2 se debe cargar la librería para leer el paquete.
# Los datos deben ser cargados desde mi carpeta "Data" dentro del repositorio "ALAN". 
# Cada script de carga de datos corresponde a sólo 1 dataset. El presente corresponde a la carga de datos de "Crecimiento".

# 1. Descarga de paquetes -------------------------------------
install.packages("readr")

# 2. Cargar librería ------------------------------------------
library(readr)

# 3. Lectura del archivo .csv desde Github  
datos_crecimiento <- "https://raw.githubusercontent.com/ValentinaGalazG/ALAN/refs/heads/main/Data/crecimiento-database-2023_Girella-laevifrons.csv"
crecimiento <- read_csv2(datos_crecimiento) #Se utiliza read_csv2 ya que este archivo .csv está en formato Europeo (utiliza punto y coma como separador, y comas como decimal)

# 4. Verificación de carga de datos
str(crecimiento)
head(crecimiento) #la función head se utiliza para visualizar las primeras filas del dataframe y así asegurarnos de tanto los datos como las variables estén identificables, separadas y en orden
