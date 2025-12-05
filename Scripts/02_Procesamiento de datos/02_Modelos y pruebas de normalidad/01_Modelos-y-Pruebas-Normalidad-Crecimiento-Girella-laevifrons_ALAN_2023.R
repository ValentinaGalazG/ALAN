# DETALLE SCRIPT

# Script para la realización de modelos y pruebas de normalidad del set de datos de Crecimiento
# Se añade, además, un test para evaluar homocedasticidad
# Chat GPT fue utilizado para la revisión y corrección de algunos aspectos del script

# 1. Instalación de paquetes 
install.packages("car") # Para el test de Homocedasticidad es necesaria la instalación de este paquete

# 2. Librería
library(car)

# 3. Cambio de variable (Crecimiento_(g)) de texto a numérica ------------------

crecimiento$`Crecimiento_(g)` <- as.numeric(crecimiento$`Crecimiento_(g)`)

str(crecimiento$`Crecimiento_(g)`) # Utilizamos la función str() para verificar que "Crecimiento_(g)" haya cambiado de "chr" a "num"

# 4. Modelo --------------------------------------------------------------------

# Realizaremos un Modelo Lineal, cuyos residuales serán evaluados en las pruebas de normalidad y homocedasticidad
# El presente modelo es de crecimiento y estará explicado por "Tratamiento" como predictor.


modelo <- lm(`Crecimiento_(g)` ~ Tratamiento, data = crecimiento) # La función lm() eliminó la fila con NA

summary(modelo) # Función summary() la utilizamos para obtener los valores del modelo


# 5. Obtención residuales del modelo -------------------------------------------

datos_modelo <- model.frame(modelo)

datos_modelo$residuos <- residuals(modelo)


# 6. Test de Normalidad --------------------------------------------------------

# Para evaluar si la distribución del dataset de Crecimiento es normal, realizaremos un test de Shapiro Wilk

shapiro.test(datos_modelo$residuos) # Si el p-value es > 0.05, entonces la distribución es normal


# 7. Test de Homocedasticidad de Varianza --------------------------------------

# Para evaluar si los datos son Homocedástico, realizaremos un test de Levene 

datos_modelo$Tratamiento <- as.factor(datos_modelo$Tratamiento) # Para declarar "Tratamiento" como un factor predictivo

leveneTest(residuos ~ Tratamiento, data = datos_modelo) # Si el p-value es > 0.05, entonces los datos son homocedásticos