# Codigo analisis ELSOC 2022
# Autor(a):
# Fecha:

# 1. Cargar librerías -----------------------------------------------------

install.packages("pacman") #para instalar
library(pacman) # para llamar/cargar

pacman::p_load(tidyverse, # colección de paquetes para manipulación de datos
               dplyr, # para manipular datos
               psych, # para analizar datos
               sjmisc, # para analizar datos
               crosstable) # para tablas de contingencia

options(scipen = 999) # para desactivar notacion cientifica
rm(list = ls()) # para limpiar el entorno de trabajo

# 2. Importar datos -------------------------------------------------------

load("output/datos_proc.Rdata")

# 3. Explorar datos -------------------------------------------------------

View(proc_elsoc) # Ver datos
names(proc_elsoc) # Nombre de columnas
dim(proc_elsoc) # Dimensiones
str(proc_elsoc) # Estructura de los datos (las clases y categorias de repuesta)

# 4. Analisis -------------------------------------------------------------

# 4.1 Variables categoricas ----

## 4.1.1 Frecuencias

sjmisc::frq(proc_elsoc$sexo)

sjmisc::frq(proc_elsoc$altruismo)

sjmisc::frq(proc_elsoc$confianza_carab)

sjmisc::frq(proc_elsoc$tramo_edad)

sjmisc::frq(proc_elsoc$tramo_ingreso)

sjmisc::frq(proc_elsoc$ingreso_minimo)

## 4.1.2 Tablas de contingencia (o doble entrada)

table(proc_elsoc$sexo, proc_elsoc$confianza_carab)

table(proc_elsoc$sexo, proc_elsoc$confianza_carab) %>%
  addmargins()

crosstable(proc_elsoc, cols = sexo, by = confianza_carab, total = "both")

# 4.2 Variables numericas ----

summary(proc_elsoc$edad)

summary(proc_elsoc$ingreso)

psych::describe(proc_elsoc$edad,
                quant = c(.25,.75),
                IQR = T)

psych::describe(proc_elsoc$ingreso,
                quant = c(.25,.75),
                IQR = T)

