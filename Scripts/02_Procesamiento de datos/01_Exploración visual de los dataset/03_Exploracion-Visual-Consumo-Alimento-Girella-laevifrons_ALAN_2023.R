# DESCRIPCIÓN SCRIPT

# El presente script tiene como finalidad la exploración rápida y sencilla de los datos de Consumo de Alimento
# Los datos faltantes están representados a través de NA

# 1. Exploración matriz de datos -----------------------------------------------

View(consumo_alimento) # Para observar la matriz de datos 


# 3. Histograma ----------------------------------------------------------------

hist(consumo_alimento$`Consumo_alimento_(%)`) # Sirve para visualizar rápidamente la distribución del set de datos


# 4. Resumen simple ------------------------------------------------------------

summary(consumo_alimento$`Consumo_alimento_(%)`) # Esta función nos permite conocer los promedios, valores mínimos y máximos y distribuciones. Es una radiografía cuantitativa rápida y efectiva para conocer cómo se comportan los datos 
