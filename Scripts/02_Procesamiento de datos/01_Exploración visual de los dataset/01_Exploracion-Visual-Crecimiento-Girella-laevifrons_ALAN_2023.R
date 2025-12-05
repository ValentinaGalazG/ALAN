# DESCRIPCIÓN SCRIPT

# El presente script tiene como finalidad la exploración rápida y sencilla de los datos de Crecimiento.
# Los datos faltantes están representados a través de NA

# 1. Exploración matriz de datos

View(crecimiento) # Para observar la matriz de datos

head(crecimiento,18) # Para observar el dataframe completo (hasta la fila 18) en la consola y no en una pestaña aparte 


# 2. Transformación de columnas de texto en columnas numéricas

crecimiento$`Crecimiento_(g)` <- as.numeric(crecimiento$`Crecimiento_(g)`) # Esta función la utilizamos para convertir la columna que era reconocida como texto: "Crecimiento_(g)" (por la presencia de NA), en una columna numérica  

 
# 3. Histograma

hist(crecimiento$`Crecimiento_(g)`) # Sirve para visualizar rápidamente la distribución del set de datos

# 4. Resumen rápido
summary(crecimiento$`Crecimiento_(g)`) # Esta función nos permite conocer los promedios, valores mínimos y máximos y distribuciones. Es una radiografía cuantitativa rápida y efectiva para conocer cómo se comportan los datos 
