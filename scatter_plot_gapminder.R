# ----- Primer intento: scatter plot -----

# ----- Carga y preprocesamiento -----
library(gapminder)
gapminder
glimpse(gapminder)

# Filtramos solo 1997
gapminder_1997 <- gapminder %>% filter(year == 1997)
gapminder_1997


# ----- mapeado aes -----

# Geometría: geom_point() (puntos)
# Mapeado: x --> gdpPercap, y --> pop
ggplot(gapminder_1997, #<< datos
       aes(x = gdpPercap, y = pop)) + #<< mapeado 
  geom_point() #<< Geometría

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
ggplot(gapminder_1997, #<< datos
       aes(y = gdpPercap, x = lifeExp)) + #<< mapeado 
  geom_point() #<< Geometría

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
# Color: rojo, fijo
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp)) +
  geom_point(color = "red") #<< color fijo

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
# Color en hexadecimal
# https://htmlcolorcodes.com/es/
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp)) +
  geom_point(color = "#2EA2D8") #<< color fijo en hexadecimal

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
# Color fijo
# Tamaño fijo: 5
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp)) +
  geom_point(color = "#A02B85", size = 5) #<<

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
# Color fijo
# Tamaño fijo: 5
# Alpha: 0.4 (transparencia del 1 - 0.4 = 60%)
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp)) +
  geom_point(color = "#A02B85", size = 9,
             alpha = 0.4) #<<

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
#         color --> continent
# Tamaño fijo: 5
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent)) + #<<
  geom_point(size = 5)

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
#         color --> continent, size --> pop
# Alpha: 0.7
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) + #<<
geom_point(alpha = 0.7)

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
#         shape --> continent, size --> pop
# Alpha: 0.7
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           shape = continent, size = pop)) +
  geom_point(alpha = 0.7)

# ------ scales y colores ------

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
#         color --> continent, size --> pop
# Alpha: 0.7
# Scale: y con escala logarítmica
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.7) +
  scale_y_log10() #<<
    

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
#         color --> continent, size --> pop
# Alpha: 0.7
# Scale: y con escala logarítmica
# Paleta de colores: manual
pal <- c("#A02B85", "#2DE86B", "#4FB2CA",
         "#E8DA2D", "#E84C2D") #<< paleta de colores
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.7) +
  scale_y_log10() +
  scale_color_manual(values = pal) #<<

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
#         color --> continent, size --> pop
# Alpha: 0.8
# Scale: y con escala logarítmica
# Paleta de colores: The Economist
library(ggthemes)
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.8) +
  scale_y_log10() +
  scale_color_economist()

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
#         color --> continent, size --> pop
# Alpha: 0.8
# Scale: y con escala logarítmica
# Paleta de colores: Excel
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.8) +
  scale_y_log10() +
  scale_color_excel()

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
#         color --> continent, size --> pop
# Alpha: 0.8
# Scale: y con escala logarítmica
# Paleta de colores: TABLEAU
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.8) +
  scale_y_log10() +
  scale_color_tableau()


# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
#         color --> continent, size --> pop
# Alpha: 0.9
# Scale: y con escala logarítmica
# Paleta de colores: harrypotter
# https://github.com/aljrico/harrypotter
library(devtools)
install_github(repo = "https://github.com/aljrico/harrypotter")
library(harrypotter)
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop)) +
  geom_point(alpha = 0.9) +
  scale_y_log10() +
  scale_color_hp_d(option = "ravenclaw")

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
#         color --> continent, size --> pop
# Alpha: 0.9
# Scale: y con escala logarítmica
# Paleta de colores: Renoir de MetBrewer (cuadros)
# https://github.com/BlakeRMills/MetBrewer
install_github("BlakeRMills/MetBrewer") 
library(MetBrewer)
MetBrewer::met.brewer("Renoir")
ggplot(gapminder_1997,
     aes(y = gdpPercap, x = lifeExp,
         color = continent, size = pop)) +
geom_point(alpha = 0.9) +
scale_y_log10() +
scale_colour_manual(values = met.brewer("Renoir"))

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
#         color --> continent, size --> pop
# Alpha: 0.9
# Scale: y con escala logarítmica
# Paleta de colores: Klimt
# https://github.com/BlakeRMills/MetBrewer
ggplot(gapminder_1997,
     aes(y = gdpPercap, x = lifeExp,
         color = continent, size = pop)) +
geom_point(alpha = 0.9) +
scale_y_log10() +
scale_colour_manual(values = met.brewer("Klimt"))

# ----- Geometrías (geom) -----

# Geometría: geom_line() (líneas)
# Mapeado: x --> lifeExp, y --> gdpPercap
# Alpha: 0.8
# Scale: y con escala logarítmica
# Paleta de colores: Tableau
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp)) +
  geom_line(alpha = 0.8) + #<<
  scale_y_log10() +
  scale_color_tableau()

# Geometría: geom_line() (líneas)
# Mapeado: x --> lifeExp, y --> gdpPercap
#          color --> continent
# Alpha: 0.8
# Scale: y con escala logarítmica
# Paleta de colores: Tableau
# Separando por continente
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent)) +
  geom_line(alpha = 0.8) +
  scale_y_log10() +
  scale_color_tableau()

# Geometría: geom_hex() (hexágonos)
# Mapeado: x --> lifeExp, y --> gdpPercap,
#          fill --> continent, size --> pop
# Alpha: 0.8
# Scale: y con escala logarítmica
# Paleta de colores: Tableau
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           fill = continent, size = pop)) +
  geom_hex(alpha = 0.8) + #<<
  scale_y_log10() +
  scale_fill_tableau() #<<

# Geometría: geom_text() (textos, necesitas pasarle label)
# Mapeado: x --> lifeExp, y --> gdpPercap
#          color --> continent, size --> pop, label --> country
# Alpha: 0.8
# Scale: y con escala logarítmica
# Paleta de colores: Tableau
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp,
           color = continent, size = pop, label = country)) +
  geom_text(alpha = 0.8) + #<<
  scale_y_log10() +
  scale_color_tableau()


# ----- Componer (facet) ------

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
# Alpha: 0.9
# Scale: y con escala logarítmica
# Facetar (componer) por continent
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp)) +
  geom_point(alpha = 0.9) +
  scale_y_log10() +
  facet_wrap(~ continent) #<<

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
# Alpha: 0.9
# Scale: y con escala logarítmica
# Facetar (componer) por continent, 3 filas
ggplot(gapminder_1997,
       aes(y = gdpPercap, x = lifeExp)) +
  geom_point(alpha = 0.9) +
  scale_y_log10() +
  facet_wrap(~ continent, nrow = 3) #<<

# Datos sin filtrar
# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
# Alpha: 0.6
# Scale: x con escala logarítmica
# Facetar (componer) por año
# Paleta de colores: Klimt
ggplot(gapminder,
       aes(y = lifeExp, x = pop,
           size = gdpPercap, color = continent)) +
  geom_point(alpha = 0.6) +
  scale_x_log10() +
  scale_colour_manual(values =
                        met.brewer("Klimt")) +
  facet_wrap(~ year)

# Datos filteados a 1952, 1972, 1982, 2002
# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
# Alpha: 0.9
# Scale: y con escala logarítmica
# Facetar en grid por year vs continent
ggplot(gapminder %>%
         filter(year %in% c(1952,  1972, 1982,  2002)),
       aes(y = gdpPercap, x = lifeExp)) +
  geom_point(alpha = 0.9) +
  scale_y_log10() +
  facet_grid(year ~ continent)

# ----- Coordenadas y tema ------

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
#          color --> continent, size --> pop
# Alpha: 0.8
# Scale: y con escala logarítmica
# Paleta de colores: tableau
# labs con título, subtítulo, caption
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

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
#          color --> continent, size --> pop
# Alpha: 0.8
# Scale: y con escala logarítmica
# Paleta de colores: tableau
# labs con título, subtítulo, caption
# labs con nombre de leyenda de colores y de tamaños
# labs con nombre de ejes
ggplot(gapminder_1997,
     aes(y = gdpPercap, x = lifeExp,
         color = continent, size = pop)) +
  geom_point(alpha = 0.8) +
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

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
#          color --> continent, size --> pop
# Alpha: 0.8
# Scale: y con escala logarítmica
# Paleta de colores: tableau
# labs con título, subtítulo, caption
# labs con nombre de leyenda de tamaños
# labs con nombre de ejes
# título de leyenda en colores ELIMINADO
ggplot(gapminder_1997,
     aes(y = gdpPercap, x = lifeExp,
         color = continent, size = pop)) +
  geom_point(alpha = 0.8) +
  scale_y_log10() +
  scale_color_tableau() +
  labs(x = "Esperanza de vida",
       y = "Renta per cápita",
       color = NULL, #<<
       size = "Población",
       title = "EJEMPLO DE SCATTERPLOT CON GGPLOT2",
       subtitle =
         "Esperanza vida vs renta per cápita (1997)",
       caption = "J. Álvarez Liébana | Datos: gapminder")

# Geometría: geom_point() (puntos)
# Mapeado: x --> lifeExp, y --> gdpPercap
#          color --> continent, size --> pop
# Alpha: 0.8
# Scale: y con escala logarítmica
# Paleta de colores: tableau
# labs con título, subtítulo, caption
# leyenda de tamaños eliminada (directamente)
# labs con nombre de ejes
# título de leyenda en colores ELIMINADO
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
