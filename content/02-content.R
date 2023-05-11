#*******************************************************************************************************************
#
#                          LABORATORIO DE ANALISIS DE DATOS
#                      SESIÓN N° 2: INTRODUCCIÓN AL LENGUAJE R.
#                     ESTADÍSTICA DESCRIPTIVA FACSO-UCHILE
#
#                           13 de abril del 2023
#                     Daniela Olivares y Andreas Laffert
#
#                 Código práctica 1: Introducción al lenguaje R.
#
#******************************************************************************************************************


# Atajos ------------------------------------------------------------------

# Comentarios en R usamos el gato o

# Cmd + Shift + C (Mac)
# Ctrl + Shift + C (Windows).

# Crear secciones

# Cmd + Shift + R (Mac)
# Ctrl + Shift + R (Windows).

# Ejecutar una línea de código

# Opción 1: Click en botón Run
# Opción 2: Ctrl + Enter (Windows)
# Opción 3: Cmd + Enter (Mac)

# Reglas practicas para escoger nombres de variables ------------------------------------------------------------------

# 1. El nombre de una variable solo puede incluir caracteres alfa-numericos y
#    el punto (.) o un guion bajo (_).
# 2. El nombre de las variables son sensibles a mayusculas, lo que significa
#    que R distingue mayusculas y minusculas.
# 3. El nombre de una variable no puede incluir espacio en blanco o comenzar
#    con un numero, a no ser que este entre comillas "". Esta NO es una
#    practica recomendada.
# 4. En textos o en sintaxis de algun/a colega podran encontrar que se asignan
#    objetos utilizando el simbolo = . Esta NO es una practica recomendada.
# 5. Evitar tildes, ñ o espacios en los nombres tanto de las carpetas como de
#   variables


# 1. Conocimientos básicos de programación en R --------------------------------------------------------

# R como calculadora

5+5

25/5

2*2

27-2

# Operatoria con más cálculos

12*(7+2)+(45-32)+8

22^2 - 2^2

1/200 * 30


# Lenguaje orientado a objetos --------------------------------------------

# Todas las instrucciones en R en las que crees objetos, es decir,
# instrucciones de asignación, tendrán la misma estructura:

# nombre_objeto <- valor


# Objetos

x <- 4 # asignar

x # ejecutar

x <- 5

x

y <- "Hola mundo" # los carácteres alfabéticos siempre van acompañados de corchetes

y

# Vectores

edad <- c(18,22,36,19,35) # concatenar (variable de razon)

edad

genero <- c(3,1,1,2,3) # masculino = 1; femenino = 2; transgenero = 3 (variable nominal)

genero

gse <- c("ABC1", "C2", "E", "ABC1", "E")  # tambíen se pueden usar carácteres (variable ordinal)

gse

## ---- ¡Hagamos un pequeño reto!----

# ¿Cuál es el valor de a y b? Si a <- 5; b <- a; a <- 4

a <- 5
b <- a
a <- 4

print(a) # imprimir en la consola

print(b)

a + 10

# Ahora, sea z = a^2 ¿qué resultado obtenemos de a * b + z?

z <- a^2 # asignar

a * b + z

j <- 5

j

## ---- Fin del reto ----


# Data.frames

base1 <- data.frame(genero, gse, edad) # Resulta como objeto de "datos" en
# entorno.

base1

View(base1)

# Ejemplo de como crear un data.frame desde 0:

base2 <- data.frame(Sexo=c("H","M","H","M","H","M"),
                    Estatura=c(1.83,1.76,1.82,1.60,1.90,1.66),
                    Peso=c(67,58,66,48,75,55))

head(base2)  # Me permite visualizar las primeras filas


# 2. Operadores --------------------------------------------------------------

20 == 5 # igualdad

30 >= 14 # mayor o igual que

22 <= 2 # menor o igual que

25 != 10 # no es igual a

p = 10; y = 5; p <= y # operatoria en objetos


# 3. Tipos de datos ----------------------------------------------------------

# Cuales son los tipos de datos?
# 1. numeric:   valores numericos, incluye decimales.
# 2. integer:   numeros enteros, no incluye decimales.
# 3. character: valores alfanumericos, ie, letras, numeros y signos mezclados.
# 4. logical:   valores logicos, TRUE o FALSE.


## ¡VEAMOS DATOS! ##


#cargamos la base de datos desde internet
load(url("https://github.com/Andreas-Lafferte/descriptiva/blob/main/data/db-proc.RData?raw=true"))

head(rand_df) # ver primeros casos de la base

# Para conocer cuál es el tipo de variable en R, utilizamos el comando class(),
# y para detallar dentro de la base de datos cuál es la variable de interés,
# utilizamos el símbolo $ posterior a la base de datos


# I) Character

class(rand_df$pais)

class(rand_df$pais)

# siempre es la misma estructura = base$variable

# II) Factor

class(rand_df$sexo)

class(rand_df$ideologia)

# III) Numeric

class(rand_df$edad)

class(rand_df$percepcion_conflictos)
