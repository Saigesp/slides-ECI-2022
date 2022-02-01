# ----- repaso día 1 -----

# ----- Paquetes vistos -----
# install.packages("glue)
# install.packages("lubridate)
# install.packages("ggplot2)
library(glue) # cadenas de texto
library(lubridate) # fechas
library(ggplot2) # dataviz

# ----- Tipos de datos individuales -----
numero <- 1
texto <- "hola"
var_logica <- texto == "adios"
var_logica
fecha <- as.Date("2021/01/01")
fecha # fecha
fecha + 1 # día siguiente a la fecha

# ----- Vectores: concatenando MISMO TIPO -----
vector_num <- c(1, 4, 7, 9, 10) # vector numérico
glue("variable_{vector_num}") # vector de texto
vector_num < 3 # vector lógico
length(vector_num) # Longitud vector
sum(vector_num) # Sumar vector numérico
vector_num[1] # acceder a primer elemento
vector_num[-1] # excluir primer elemento
vector_num[c(1, 3:4)] # acceder a varios elementos
  
# ----- Matrices: concatenando vectores MISMO TIPO Y LONG -----
mat <- cbind("a" = 1:3, "b" = c(-1, 5, 6)) # construir matriz
mat
apply(mat, MARGIN = 2, FUN = mean) # media por columnas

# ----- data.frame: concatenando vectores igual longitud -----

df <- data.frame("nombre" = c("javi", "mar", "carlos"),
                 "hermanos" = 1:3,
                 "soltero" = c(TRUE, NA, FALSE),
                 "fecha_nac" = as.Date(c("1989-01-01", "1989-02-02",
                                         "1989-03-03")))
df
df$nombre # acceder a columnas por nombre
df[, 1] # acceder a columnas por índice

# ----- Primer análisis: datos de arrestos de EE.UU -----

USArrests

# ¿Qué tipo de objeto es?
class(USArrests)

# ¿Cómo buscar información de los datos?
? USArrests

# ¿Qué variables tenemos?
names(datasets::USArrests)

# ¿Qué dimensiones tiene nuestro objeto?
dim(datasets::USArrests)
nrow(datasets::USArrests)
ncol(datasets::USArrests)
 
# Añadir variable: incluir nombre de filas como nueva columna
tabla_nueva <- data.frame("estado" = row.names(USArrests),
                          USArrests)
head(tabla_nueva) # Cabecera de la tabla

# ¿Cómo seleccionar solo las columnas `Murder` y `Assault` para
# el segundo y el décimo estado?
USArrests[c(2, 10), c("Murder", "Assault")]

# Subset: seleccionar solo los delitos de asesinato y agresión
# de estados cuyo porcentaje de población urbana > 80%.
subset(USArrests, subset = UrbanPop > 80,
       select = c("Murder", "Assault"))

