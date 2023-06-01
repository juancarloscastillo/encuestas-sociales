library(haven)
library(dplyr)
library(summarytools)
library(ggplot2)


# 1. ABRIR DATOS Y PREPARAR BBDD ----

# -- 1.1. Cargar datos desde carpeta "datos" ----
CEP <- read_sav("Input/datos/CEP_dic2019.sav")


# -- 1.2. Renombrar variables: Edad y Satisfaccion con la vida ----
CEP2 <- rename(CEP, edad = DS_P2_EXACTA, satisfaccion = SV_1)
