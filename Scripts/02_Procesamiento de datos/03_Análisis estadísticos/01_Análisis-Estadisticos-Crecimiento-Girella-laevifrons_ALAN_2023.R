# DETALLE SCRIPT

# Script para la realización de análisis estadísticos sobre la base de datos de Crecimiento
# Se incluye la función para realizar ANOVA de 1 vía: 1 factor (Tratamiento) con 3 niveles (Cold_ALAN; Warm_ALAN; Control).
# Se añade code para plottear los resultados del ANOVA
# El script finaliza con código para el saving de Figura en formato paper "TIFF"
# Realizado bajo el apoyo del script de la tesis doctoral correspondiente al Dr. Diego Maturana Roldán (2023)
# Chat GPT-5.1 fue utilizado para la revisión y corrección de algunos errores en el script. Adicionalmente, aconsejó los códigos para los colores de la figura


# 1. Instalación de paquetes ---------------------------------------------------
install.packages("dplyr") # Para la manipulación de dataframes 
install.packages("rlang") # Facilita el uso de nuevos operadores en el script
install.packages("ggplot2") # Crea visualizaciones de datos elegantes y complejas
install.packages("dichromat") # Paquete para facilitar la visualización de plots a personas con daltonismo

# 2. Librería ------------------------------------------------------------------
library(dplyr)
library(rlang)
library(ggplot2)
library(dichromat)


# 3. Análisis de Varianza (ANOVA) de 1 vía -------------------------------------
anova(modelo_crecimiento)


# 4. Gráfico de barras + error estándar (SE) -----------------------------------

resumen_datos <- function(data, varname, groupnames)
  {var_sym <- rlang::sym(varname)
  group_syms <- rlang::syms(groupnames)
  
data %>% 
  group_by(!!!group_syms) %>%
  summarise(
    mean = mean(!!var_sym, na.rm = TRUE),
    se = sd(!!var_sym, na.rm = TRUE) / sqrt(sum(!is.na(!!var_sym))),
    .groups = "drop") %>%
    rename(!!varname:= mean)}
    
tabla <- resumen_datos(crecimiento, varname = "Crecimiento_(g)",
                                    groupnames = c("Tratamiento"))
  
head(tabla) # Para obtener la tabla con promedios y errores estándar de cada tratamiento


# 5. Preparación de paletas previa a la visualización gráfica

# En esta sección utilizaremos el paquete "dichromat" instalado con anterioridad

base_cols <- c(
  Cold_ALAN = "#1F78B4",
  Control = "#9DA3A6",
  Warm_ALAN = "#E31A1C") # Generamos la paleta base de colores

cb_cols <- dichromat(base_cols, type = "tritan")

# 6. Visualización Gráfica del ANOVA -------------------------------------------
ggplot(visual,
       aes(x = Tratamiento,
           y = `Crecimiento_(g)`,
           fill = Tratamiento)) + 
      geom_col(color = "black", width = 0.6, linewidth = 0.5) +
      geom_errorbar(aes(ymin = `Crecimiento_(g)` - se,
                        ymax = `Crecimiento_(g)` + se),
                    width = 0.15, 
                    linewidth = 0.5) + 
      scale_fill_manual(values = cb_cols) + 
      geom_hline(yintercept = 0, linewidth = 0.4) + 
      scale_y_continuous(
        expand = expansion(mult = c(0.15, 0.35))
      ) +
      labs (x = "Tratamiento",
            y = "Crecimiento (g)") + 
      theme_classic(base_size = 10) +
      theme(
        plot.title = element_text(hjust = 2.5, vjust = 0.05, size = 11),
        axis.title.x = element_text(face = "bold",
                                    margin = margin(t = 15),
                                    size = 12),
        axis.title.y = element_text(face = "bold",
                                    margin = margin(r = 10),
                                    size = 12),
        legend.position = "none",
        axis.text.x = element_text(angle = 0,
                                   vjust = 0.3,
                                   hjust = 0.5,
                                   size = 10),
        axis.text.y = element_text(vjust = 0.3,
                                   hjust = 0.5,
                                   size = 9)
      )

# 7. Guardado de la figura resultante en formato TIFF

ggsave("Fig.1_Crecimiento-Girella-laevifrons_ALAN_2023.tiff",
       plot = last_plot(),
       dpi = 600,
       width = 12,
       height = 8,
       units = "cm",
       compression = "lzw")