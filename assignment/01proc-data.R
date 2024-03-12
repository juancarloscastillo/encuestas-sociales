
# Codigo procesamiento ELSOC 2022
# Autor(a):
# Fecha:

# 1. Cargar librerías -----------------------------------------------------

install.packages("pacman") #para instalar
library(pacman) # para llamar/cargar

pacman::p_load(tidyverse, # colección de paquetes para manipulación de datos
               dplyr, # para manipular datos
               haven, # para importar datos
               car) # para analizar datos

options(scipen = 999) # para desactivar notacion cientifica
rm(list = ls()) # para limpiar el entorno de trabajo

# 2. Importar datos -------------------------------------------------------

elsoc_2022 <- read_dta("input/data/elsoc_w06_subset.dta")

# 3. Explorar datos -------------------------------------------------------

View(elsoc_2022) # Ver datos
names(elsoc_2022) # Nombre de columnas
dim(elsoc_2022) # Dimensiones
str(elsoc_2022) # Estructura de los datos (las clases y categorias de repuesta)

# 4. Procesamiento --------------------------------------------------------

# 4.1 Seleccionar ----

proc_elsoc <- elsoc_2022 %>%
  select(edad = m0_edad,
         sexo = m0_sexo,
         ingreso = m13,
         altruismo = c03,
         confianza_carab = c05_03)

proc_elsoc

# 4.2 Filtrar ----

proc_elsoc <- proc_elsoc %>% filter(edad >= 25)

proc_elsoc


# 4.3 Recodificar ----

proc_elsoc <- proc_elsoc %>%
  mutate(sexo = car::recode(sexo,
                            recodes = c("'Hombre' = 'Masculino'; 'Mujer' = 'Femenino'")),
         ingreso = car::recode(ingreso,
                               recodes = c("-888 = NA; -999 = NA")))


proc_elsoc <- proc_elsoc %>%
  mutate(altruismo = car::recode(altruismo,
                                 recodes = c("1 = 'La mayoria de las veces tratan de ayudar a los demas';
                                              2 = 'La mayoria de las veces se preocupan solo de si mismas';
                                              3 = 'Depende';
                                              -666 = NA;
                                              -777 = NA;
                                              -888 = NA;
                                              -999 = NA"),
                                 as.factor = TRUE),
         confianza_carab = car::recode(confianza_carab,
                                       recodes = c("1 = 'Nada';
                                                    2 = 'Poca';
                                                    3 = 'Algo';
                                                    4 = 'Bastante';
                                                    5 = 'Mucha';
                                                    -666 = NA;
                                                    -777 = NA;
                                                    -888 = NA;
                                                    -999 = NA"),
                                       as.factor = TRUE,
                                       levels = c("Nada",
                                                  "Poca",
                                                  "Algo",
                                                  "Bastante",
                                                  "Mucha")))


# 4.4 Tratamiento casos perdidos ----

is.na(proc_elsoc)

is.na(proc_elsoc$ingreso)

sum(is.na(proc_elsoc))

colSums(is.na(proc_elsoc))

proc_elsoc <- na.omit(proc_elsoc)

proc_elsoc


# 5. Transformar variables ------------------------------------------------

proc_elsoc <- proc_elsoc %>% mutate(ano = 2022)

proc_elsoc

proc_elsoc <- proc_elsoc %>%
  mutate(tramo_edad = case_when(edad <= 29 ~ "Jovenes",
                                edad >= 30 & edad <= 59 ~ "Adultos",
                                edad >= 60 ~ "Adutos mayores"),
         tramo_ingreso = case_when(ingreso <= 250000 ~ "Tramo 1",
                                   ingreso > 250000 & ingreso <= 500000 ~ "Tramo 2",
                                   ingreso > 500000 & ingreso <= 750000 ~ "Tramo 3",
                                   ingreso > 750000 & ingreso <= 1000000 ~ "Tramo 4",
                                   ingreso > 1000000 ~ "Tramo 5"))

proc_elsoc

proc_elsoc <- proc_elsoc %>%
  mutate(ingreso_minimo = if_else(ingreso < 410000, "debajo minimo", "sobre minimo"))

proc_elsoc


# 6. Guardar y exportar ---------------------------------------------------

save(proc_elsoc, file = "output/datos_proc.Rdata")

