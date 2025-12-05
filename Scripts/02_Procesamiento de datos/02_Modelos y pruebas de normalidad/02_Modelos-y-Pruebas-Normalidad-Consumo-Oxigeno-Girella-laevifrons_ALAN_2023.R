# DETALLE SCRIPT

# Script para la realización de modelos y pruebas de normalidad del set de datos de Consumo de Oxígeno
# Se añade, además, un test para evaluar homocedasticidad
# Chat GPT fue utilizado para la revisión y corrección de algunos aspectos del script

# 1. Instalación de paquetes 
install.packages("car") # Para el test de Homocedasticidad es necesaria la instalación de este paquete

# 2. Librería
library(car)

# 3. Corroboración variable numérica
str(consumo_oxigeno$`Consumo_oxigeno_(mgO2)`) # Utilizaremos la función str() para verificar que la variable "Consumo_oxigeno_(mgO2)" realmente esté como número y no como caracter

# 4. Modelo --------------------------------------------------------------------

# Realizaremos un Modelo Lineal, cuyos residuales serán evaluados en las pruebas de normalidad y homocedasticidad
# El presente modelo es de Consumo de Oxígeno (O2) y estará explicado por "Tratamiento" como predictor.


modelo_consumo_O2 <- lm(`Consumo_oxigeno_(mgO2)` ~ Tratamiento, data = consumo_oxigeno) # La función lm() eliminó la fila con NA)

summary(modelo_consumo_O2) # Función summary() la utilizamos para obtener los valores del modelo


# 5. Obtención residuales del modelo -------------------------------------------

residuales_consumo_oxigeno <- model.frame(modelo_consumo_O2)

residuales_consumo_oxigeno$residuos <- residuals(modelo_consumo_O2)


# 6. Test de Normalidad --------------------------------------------------------

# Para evaluar si la distribución del dataset de Consumo de oxígeno es normal, realizaremos un test de Shapiro Wilk

shapiro.test(residuales_consumo_oxigeno$residuos) # Si el p-value es > 0.05, entonces la distribución es normal


# 7. Test de Homocedasticidad de Varianza --------------------------------------

# Para evaluar si los datos son Homocedástico, realizaremos un test de Levene 

residuales_consumo_oxigeno$Tratamiento <- as.factor(residuales_consumo_oxigeno$Tratamiento) # Para declarar "Tratamiento" como un factor predictivo

leveneTest(residuos ~ Tratamiento, data = residuales_consumo_oxigeno) # Si el p-value es > 0.05, entonces los datos son homocedásticos
