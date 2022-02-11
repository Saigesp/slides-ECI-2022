
# ----- Introducción a tidyverse -----

# install.packages("tidyverse") # SOLO la primera vez
library(tidyverse)

# conjunto de starwars
starwars
# Ver variables
glimpse(starwars)

# Dimensiones
dim(starwars)

# Definir como queremos que salga por consola (filas y columnas)
print(starwars, n = 3, width = Inf)

# ----- Seleccionar filas -----

# Filtrar ojos marrones
starwars %>% filter(eye_color == "brown") #<<

# Filtrar los que NO tienen ojos marrones
starwars %>% filter(eye_color != "brown")

# con color de ojos dentro de {marrones, azules, rojos}
starwars %>% 
  filter(eye_color %in% c("brown", "blue", "red"))

# Con between filtramos por rango: altura entre 120 y 160
starwars %>% filter(between(height, 120, 160))

# Ojos marrones y no humanos
starwars %>% filter(eye_color == "brown" & species != "Human")

# Ojos con valores {blue, rojo} Y no humanos Y menos de 50 años
starwars %>%  filter(eye_color %in% c("blue", "red") & species != "Human" & birth_year < 50)

# slice: extramos filas por índice de fila.
starwars %>% slice(1) # primera fila
starwars[1, ]

# slice: extraemos quinta, séptima y novena fila
starwars %>% slice(c(5, 7, 9))

# Extraemos filas pares del 2 al 8 (2, 4, 6, 8)
starwars %>% slice(seq(2, 8, by = 2)) # filas pares hasta la octava

# 3 primeras filas 
starwars %>% slice_head(n = 3) 

# 2 últimas filas 
starwars %>% slice_tail(n = 2) 

# También podemos hacer una extracción al azar de filas
starwars %>% slice_sample(n = 3) # 3 al azar
starwars %>% slice_sample(n = 3) # 3 al azar nuevas

# Podemos extraer filas en función del mín/máx de una variable
starwars %>% slice_min(height, n = 2) # los 2 más bajitos
starwars %>% slice_max(mass, n = 2) # los 3 más pesados

# Con arrange ordenamos en base al orden de la variable que introduzcamos
# ordenamos por altura de menor a mayor
starwars %>% arrange(height) 

# Por defecto lo hace ascendente pero podemos cambiarlo
starwars %>% arrange(desc(height))

# En caso de empate...otra variable para el orden
starwars %>% arrange(height, desc(mass))

# Ojos marrones y humanos y hombres, ordenados de menor a mayor en altura
# de mayor a menor en peso
starwars %>%
 filter(eye_color == "brown",
        species == "Human", sex == "male") %>%
 arrange(height, desc(mass))

# eliminamos las 5 primeras filas
starwars %>% slice(-(1:5)) 

# Eliminamos todos los registros que tengan en NA en algún lado
starwars %>% drop_na()

# Eliminamos registros con NA en las columnas mass, height
starwars %>% drop_na(mass, height)

# Eliminamos registros con igual par (color_pelo, color_ojos)
starwars %>%
  distinct(hair_color, eye_color)

# Añadimos filas
starwars_nuevo <- bind_rows(starwars, starwars[1:3, ])
dim(starwars)
dim(starwars_nuevo)

# ----- Seleccionar columnas -----

# Seleccionamos solo 1 columna: color de pelo
starwars %>% select(hair_color) 

# seleccionamos solo 3 columnas: pelo, piel y ojos
starwars %>% select(c(hair_color, skin_color, eye_color))

# eliminamos 3 columnas: pelo, piel y ojos
starwars %>% select(-c(hair_color, skin_color, eye_color))

# Podemos seleccionar columnas por sufijo y prefijo
starwars %>% select(ends_with("color")) # acaban en "color"
starwars %>% select(starts_with("h")) # empiezan por h

# Seleccionamos solo la columnas numéricas
starwars %>% select(where(is.numeric))

# Sellecionamos solo las columnas character
starwars %>% select(where(is.character))

# rename: renombrar columnas, primero el nuevo y luego el antiguo
starwars %>% rename(nombre = name, altura = height, peso = mass)

# Recolocamos columnas
starwars %>% # altura y masa detrás de color de piel
  relocate(height, mass, .after = skin_color) 

# Visualizar el flujo de datos
# https://tidydatatutor.com/

# Crear nuevas variables (mutate): creamos variable con altura en metros
starwars %>% mutate(height_m = height / 100) %>%
  relocate(height_m, .after = height) # recolocamos columna

# Solo nos muestra la creada
starwars %>% transmute(height_m = height / 100)

# Recategorizar variables
starwars %>%
  transmute(altura = case_when(height > 180 ~ "altos",
                               height > 120 ~ "bajos",
                               height > 0 ~ "enanos",
                               TRUE ~ "ausentes"))

# ----- Funciones -----

# encapsulando y ordenando nuestro código

# Definición del nombre de función y argumentos de entrada
calcular_area <- function(lado_1, lado_2) {
  
  # Resultado que devolvemos
  return(lado_1 * lado_2)
  
}

# ¿Cómo aplicar la función?
calcular_area(5, 3) # área de un rectángulo 5 x 3 

# Función con args por defecto
calcular_area <- function(lado_1, lado_2 = lado_1) {
  
  # Cuerpo de la función
  area <- lado_1 * lado_2
  
  # Resultado que devolvemos
  return(area)
  
}
calcular_area(lado_1 = 5)


# ----- datos tibble ------

library(tibble)
# tibble
tabla_tb <- tibble("x" = 1:30, "y" = rep(c("a", "b", "c"), 10),
                   "z" = 31:60, "logica" = rep(c(TRUE, TRUE, FALSE), 10))
tabla_tb


# ----- dataviz -----
  
# gapminder
library(gapminder)
gapminder
glimpse(gapminder)

# Filtramos datos de 1997
gapminder_1997 <- gapminder %>% filter(year == 1997)
gapminder_1997

# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop
# Geomerría: geom_point()
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp)) +
  geom_point() 

# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop
# Geometría: geom_point()
# Color fijo: "red"
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp)) +
  geom_point(color = "red")

# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop
# Geometría: geom_point()
# Color fijo: en hexadecimal
# https://htmlcolorcodes.com/es/
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp)) +
  geom_point(color = "#2EA2D8")

# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop
# Geometría: geom_point()
# Color fijo: en hexadecimal
# Tamaño: 5
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp)) +
  geom_point(color = "#A02B85", size = 5) 

# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop
# Geometría: geom_point()
# Color fijo: en hexadecimal
# Tamaño: 5
# Alpha (transparencia) = 40%
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp)) +
  geom_point(color = "#A02B85", size = 9,
             alpha = 0.4) 

# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop, color = continent
# Geometría: geom_point()
# Tamaño fijo: 5
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent)) + 
  geom_point(size = 5)

# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop, color = continent, size = pop
# Geometría: geom_point()
# Transparencia: 70%
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.7)

# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop, shape = continent, size = pop
# Geometría: geom_point()
# Transparencia: 70%
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           shape = continent, size = pop)) +
  geom_point(alpha = 0.7)


# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop, color = continent, size = pop
# Geometría: geom_point()
# Transparencia: 70%
# Escalas: y escala logarítmica
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.7) +
  # Eje Y con escala logarítmica
  scale_y_log10()

# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop, color = continent, size = pop
# Geometría: geom_point()
# Transparencia: 70%
# Escalas: y escala logarítmica
# Escalas: paleta de colores dados manualmente
pal <- c("#A02B85", "#2DE86B", "#4FB2CA",
         "#E8DA2D", "#E84C2D")
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.7) +
  scale_y_log10() +
  # Escala manual de colores
  scale_color_manual(values = pal)

# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop, color = continent, size = pop
# Geometría: geom_point()
# Transparencia: 80%
# Escalas: y escala logarítmica
# Escalas: paleta de colores de the economist
library(ggthemes)
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.8) +
  scale_y_log10() +
  scale_color_economist()

# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop, color = continent, size = pop
# Geometría: geom_point()
# Transparencia: 80%
# Escalas: y escala logarítmica
# Escalas: paleta de colores de Tableau
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.8) +
  scale_y_log10() +
  scale_color_tableau()

# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop, color = continent, size = pop
# Geometría: geom_point()
# Transparencia: 90%
# Escalas: y escala logarítmica
# Escalas: paleta de colores de harrypotter
library(devtools)
install_github(repo = "https://github.com/aljrico/harrypotter")
library(harrypotter)
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.9) +
  scale_y_log10() +
  scale_color_hp_d(option = "ravenclaw")

# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop, color = continent, size = pop
# Geometría: geom_point()
# Transparencia: 90%
# Escalas: y escala logarítmica
# Escalas: paleta de colores de pintores
devtools::install_github("BlakeRMills/MetBrewer") 
library(MetBrewer)
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.9) +
  scale_y_log10() +
  scale_colour_manual(values = met.brewer("Renoir"))

# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop, fill = continent, size = pop
# Geometría: geom_hex()
# Transparencia: 70%
# Escalas: y escala logarítmica
# Escalas: paleta de colores de Tableau
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           fill = continent, size = pop)) +
  geom_hex(alpha = 0.8) + 
  scale_y_log10() +
  scale_fill_tableau()

# Capas:
# Datos: gapminder_1997
# mapeado: x = gdpPercap, y = pop, color = continent, size = pop
# Geometría: geom_text())
# Transparencia: 80%
# Escalas: y escala logarítmica
# Escalas: paleta de colores de Tableau
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop, label = country)) +
  geom_text(alpha = 0.8) + #<<
  scale_y_log10() +
  scale_color_tableau()


# Componer (facet)
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp)) +
  geom_point(alpha = 0.9) +
  scale_y_log10() +
  facet_wrap(~ continent) #<<

# Componer con todas
library(MetBrewer)
ggplot(gapminder,
       aes(y = lifeExp, x = pop,
           size = gdpPercap, color = continent)) +
  geom_point(alpha = 0.6) +
  scale_x_log10() +
  scale_colour_manual(values =
                        met.brewer("Klimt")) +
  facet_wrap(~ year) #<<


# Cuadrícula en base a dos variables
ggplot(gapminder %>%
         filter(year %in% c(1952,  1972, 1982,  2002)),
       aes(y = gdpPercap, x = lifeExp)) +
  geom_point(alpha = 0.9) +
  scale_y_log10() +
  facet_grid(year ~ continent)

# Tema
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.8) +
  scale_y_log10() +
  scale_color_tableau() +
  labs(title = "EJEMPLO DE SCATTERPLOT CON GGPLOT2",
       subtitle =
         "Esperanza vida vs renta per cápita (1997)",
       caption = "J. Álvarez Liébana | Datos: gapminder")

# Nombres leyendas y ehes
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.8) +
  # Eje Y con escala logarítmica
  scale_y_log10() +
  scale_color_tableau() +
  labs(x = "Esperanza de vida", #<<
       y = "Renta per cápita", #<<
       color = "Continente", #<<
       size = "Población", #<<
       title = "EJEMPLO DE SCATTERPLOT CON GGPLOT2",
       subtitle =
         "Esperanza vida vs renta per cápita (1997)",
       caption = "J. Álvarez Liébana | Datos: gapminder")

# Borrar leyendas
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.8) +
  scale_y_log10() +
  scale_color_tableau() +
  labs(x = "Esperanza de vida",
       y = "Renta per cápita",
       color = NULL,
       size = "Población",
       title = "EJEMPLO DE SCATTERPLOT CON GGPLOT2",
       subtitle =
         "Esperanza vida vs renta per cápita (1997)",
       caption = "J. Álvarez Liébana | Datos: gapminder")

# Ocultar leyenda directamente (no solo el nombre)
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.8) +
  scale_y_log10() +
  scale_color_tableau() +
  guides(size = "none") + #<<
  labs(x = "Esperanza de vida",
       y = "Renta per cápita",
       color = NULL, size = "Población",
       title = "EJEMPLO DE SCATTERPLOT CON GGPLOT2",
       subtitle =
         "Esperanza vida vs renta per cápita (1997)",
       caption = "J. Álvarez Liébana | Datos: gapminder")

# ----- Segundo intento: diagrama de barras -----

library(tidyverse)

# Eliminamos los registros con ausente en especie
starwars %>%
  filter(!is.na(species)) %>%
  count(species)

# Diagrama de barras
ggplot(starwars %>%
         filter(!is.na(species)) %>%
         count(species),
       aes(y = species, x = n)) +
  geom_col() #<<

# Codificando el color
ggplot(starwars %>%
         filter(!is.na(species)) %>%
         count(species),
       aes(y = species, x = n, fill = n)) + #<<
  geom_col() +
  scale_fill_continuous_tableau() + #<<
  labs(fill = "Frecuencia absoluta",
       x = "Número de personajes",
       y = "Especies")

# Reagrupamos modalidades de especies
ggplot(starwars %>%
         filter(!is.na(species)) %>%
         mutate(species =
                  fct_lump_min(species, min = 3,
                               other_level =
                                 "Otras especies")) %>%
         count(species),
       aes(y = species, x = n, fill = n)) +
  geom_col() +
  scale_fill_continuous_tableau() +
  labs(fill = "Frecuencia absoluta",
       x = "Número de personajes", y = "Especies")

# Nubes de palabras
library(wordcloud2)
wordcloud2(starwars %>% drop_na(species) %>%
             mutate(species =
                      fct_lump_min(species, min = 2,
                                   other_level = "otras")) %>% 
             count(species),
           size = 0.8, color= 'random-dark')


# Mosaicos o treemaps
library(treemapify)
library(MetBrewer)
ggplot(starwars %>% drop_na(species) %>%
         mutate(species =
                      fct_lump_min(species, min = 2,
                                   other_level = "otras")) %>%
         count(species),
       aes(area = n, fill = species, label = species)) +
  geom_treemap() + #<<
  scale_fill_manual(values =
                      met.brewer("Renoir")) +
  labs(fill = "Especies")

# Mosaicos o treemaps
# con `geom_treemap_text()` podemos además escribir el nombre de
# los niveles, pudiendo eliminar la leyenda.
ggplot(starwars %>% drop_na(species) %>%
         mutate(species =
                      fct_lump_min(species, min = 2,
                                   other_level = "otras")) %>%
         count(species),
       aes(area = n, fill = species, label = species)) +
  geom_treemap() +
  geom_treemap_text(colour = "white", 
                    place = "centre",
                    size = 17) +
  scale_fill_manual(values = met.brewer("Renoir")) +
  labs(fill = "Especies") +
  guides(fill = "none")
