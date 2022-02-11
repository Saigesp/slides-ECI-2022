
# ----- tidy data: ordenando los datos -----

# Los conjuntos tidy o datos ordenados tienen tres objetivos principales:
  
# 1. Estandarización en su estructura.
# 2. Sencillez en su manipulación.
# 3. Listos para ser modelizados y visualizados.

# * Cada variable en una columna.
# * Cada observación/registro/individuo en una fila diferente.
# * Cada celda con un único valor.
# * Cada conjunto o unidad observacional conforma una tabla


# Messy data: valores en el nombre
library(tidyr)
table4a

# pivot_longer: pivotando tablas
# * `cols`: el nombre de las columnas a pivotar.
# * `names_to`: el nombre de la columna a la que vamos a mandar los
#               valores que figuran ahora en los nombres de las columnas.
# * `values_to`: el nombre de la columna a la que vamos a mandar los valores.
table4a %>% pivot_longer(cols = c("1999", "2000"), names_to = "year",
                         values_to = "values") #<<
# Segundo ejemplo: relig_income
relig_income[1:3, ]
# No necesitamos comillas en el nombre salvo que tengan caracteres que no sean letras
relig_income %>% pivot_longer(-religion, names_to = "ingresos", values_to = "frec") #<<


# Messy data: un registro en varias filas
table2[1:3, ]
table2 %>% pivot_wider(names_from = type, values_from = count) #<<

# Messy data: múltiples valores en celda
table3
table3 %>% separate(rate, into = c("cases", "population")) #<<

# Messy data: múltiples valores en celda
# Si queremos un caracter concreto para dividir podemos indicárselo explícitamente
table3 %>% separate(rate, into = c("cases", "population"), sep = "/")

# Podemos separar columnas también podemos unirlas.
# Para ello vamos a usar la tabla `table5`: con la función `unite()`
# vamos a unir el siglo (en century) y el año (en year).
table5 %>% unite(date, century, year) #<<


# Convertir al tipo adecuado
table3 %>%
  separate(rate, into = c("cases", "population"), convert = TRUE)
