#DETALLE DEL SCRIPT

# El presente script nos permitirá descargar los datos correspondientes al ensayo realizado durante el mes de Junio del año 2023, sobre los organismos juveniles de Girella laevifrons bajo las condiciones experimentales descritas y detalladas en el archivo "README.md"
# Los datos deben ser cargados desde mi carpeta "Data" dentro del repositorio "ALAN". 
# Cada script de carga de datos corresponde a sólo 1 dataset. El presente corresponde a la carga de datos de "Crecimiento".

# 1. Descarga de paquetes -------------------------------------
install.packages("readr") #Paquete "readr" permite la importación de datos desde archivos de texto ".csv" a Dataframes en R.

# 2. Cargar librería ------------------------------------------
library(readr) # La librería convoca al paquete para poder hacer la lectura del archivo .csv

# 3. Lectura del archivo .csv desde Github  
datos_crecimiento <- "https://raw.githubusercontent.com/ValentinaGalazG/ALAN/refs/heads/main/Data/crecimiento-database-2023_Girella-laevifrons.csv"
crecimiento <- read_csv2(datos_crecimiento) #Se utiliza read_csv2 ya que este archivo .csv está en formato Europeo (utiliza punto y coma como separador, y comas como decimal)

# 4. Verificación de carga de datos
str(crecimiento) # La función str() permite ver el número de filas, columnas y el nombre de las mismas.
head(crecimiento) # La función head() se utiliza para visualizar las primeras filas del dataframe y así asegurarnos de que tanto los datos como las variables estén identificables, separadas y en orden
