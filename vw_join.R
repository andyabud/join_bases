# En este script se cargarán 2 bases de datos. La primera llamada "campanas vw" tiene información sobre las campañas pero no están los KPI de cada campaña. La segunda base tiene los KPI. 

# Ambas bases comparten la variable "Impresiones" por lo tanto la idea es crear las bbdd, limpiarlas y cambiar formatos de variable (probablemente variables numéricas que están dispuestas como caracteres). Luego de limpiarlas se procederá a hacer un inner join para juntar las bases en base al Mes y cantidad de Impresiones que comparten, ya que hay campañas con el mismo nombre que duran más de un mes.

# Cargar Librerías --------------------------------------------------------

library(tidyverse) # Orden y manipulación de datos, gráficos
library(highcharter) # Gráficos interactivos
library(kableExtra) # Tablas bonitas en html
library(DT) # Tablas con mayores prestaciones
library(openxlsx) # Para guardar las bbdd a formato xlsx

# Crear base de datos -----------------------------------------------------

## Crear df de campañas de VW que me entregaron
campanas_vw <- readxl::read_xlsx("data/resumen_metricas_vw.xlsx")
glimpse(campanas_vw) # Las variables están bien catalogadas

## Crear df de kpi campañas
kpi_campanas <- readxl::read_xlsx("data/consolidado_kpi_ene_ago.xlsx")

glimpse(kpi_campanas) # Hay variables numéricas que son caracter

## Cambiar de formato las variables Frecuencia, CPM, CPC, CTR de caracter a numérica
kpi_campanas$Frecuencia <- as.numeric(kpi_campanas$Frecuencia)
kpi_campanas$CPM <- as.numeric(kpi_campanas$CPM)
kpi_campanas$CPC <- as.numeric(kpi_campanas$CPC)
kpi_campanas$CTR <- as.numeric(kpi_campanas$CTR)

## Hacer un Inner Join
consolidado_campanas <- campanas_vw %>% # base madre
  inner_join(kpi_campanas, by = c("Mes", "Impresiones")) # base que se quiere fusionar y bajo qué parámetros

glimpse(consolidado_campanas) # revisar nueva bbdd fusionada


# Guardar base consolidado campañas en un xlsx y csv

## xlsx
write.xlsx(consolidado_campanas, "consolidado_campañas.xlsx")

##csv
write.csv(consolidado_campanas, "consolidado_campañas.csv")


