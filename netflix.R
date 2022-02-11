# ----- CASO PRÁCTICO: BARRAS DE NETFLIX

# ----- Preprocesamiento -----

# Carga datos
netflix <-
  read_csv('https://raw.githubusercontent.com/elartedeldato/datasets/main/netflix_titles.csv')
netflix

# Filtramos solo películas que tengan "HIGH SCHOOL" en la descripción
# con str_detect detectamos si contiene el patrón
# con toupper pasamos a mayúsculas
netflix_hs <- netflix %>%
  filter(str_detect(toupper(description), "HIGH SCHOOL"))
netflix_hs 

# Eliminamos registros con ausente en fecha de estreno en netflix
netflix_filtro <- 
  netflix_hs %>% filter(!is.na(date_added))

# Preprocesamos fecha para obtener el año
library(lubridate)
mdy("August 26, 2016")
mdy("January 13, 2015")
netflix_final <- 
  netflix_filtro %>%
  mutate(year = year(mdy(date_added)))

# Contamos número de películas por años
netflix_resumen <- 
  netflix_final %>%
  group_by(year) %>% #<<
  count() %>%
  ungroup() #<<
netflix_resumen

# ----- Diagrama de barras ----- 
  
# Barras: geom_col
# Mapeado: x --> year, y --> n (frecuencia)
ggplot(netflix_resumen,
       aes(x = year, y = n)) +
  geom_col() 

# Barras: geom_col
# Mapeado: x --> year, y --> n (frecuencia)
# Color: rojo fijo
ggplot(netflix_resumen,
       aes(x = year, y = n)) +
  geom_col(fill = "red") #<<

# Barras: geom_col
# Mapeado: x --> year, y --> n (frecuencia)
# Color: rojo fijo
# Fijamos las marcas del eje x para que muestre todos los años
ggplot(netflix_resumen,
       aes(x = year, y = n)) +
  geom_col(fill = "red") +
  scale_x_continuous(breaks = netflix_resumen$year) #<<


# Barras: geom_col
# Mapeado: x --> year, y --> n (frecuencia)
# Color: rojo fijo
# Títulos, subtítulos y caption
ggplot(netflix_resumen,
       aes(x = year, y = n)) +
  geom_col(fill = "red") +
  scale_x_continuous(breaks = netflix_resumen$year) +
  labs(title = "NETFLIX", #<<
       subtitle = "Películas y series de instituto",
       caption =
         "Basada en El Arte del Dato (https://elartedeldato.com) | Datos: Kaggle")

# Barras: geom_col
# Mapeado: x --> year, y --> n (frecuencia)
# Color: rojo fijo
# Títulos, subtítulos y caption
# Fuente propia
# Tema: sin leyenda / fuentes y colores título
library(sysfonts)
library(showtext)
font_add_google(family = "Bebas Neue",
              name = "Bebas Neue")
showtext_auto()

gg <- ggplot(netflix_resumen, aes(x = year, y = n)) +
  geom_col(fill = "red") +
  scale_x_continuous(breaks = netflix_resumen$year) +
  theme_minimal() + # lo inicializamos en lo mínimo, también hay theme_void()
  theme(legend.position = "none",
        plot.title =
          element_text(family = "Bebas Neue",
                       color = "red", size = 80)) +
  labs(title = "NETFLIX",
       subtitle = "Películas y series de instituto",
       caption = "Basada en El Arte del Dato (https://elartedeldato.com) | Datos: Kaggle")
gg

# Barras: geom_col
# Mapeado: x --> year, y --> n (frecuencia)
# Color: rojo fijo
# Títulos, subtítulos y caption
# Fuente propia
# Tema: sin leyenda / fuentes y colores título
#       fondo de area de gráfica y general negra
gg <- 
  gg +
  theme(panel.background = element_rect(fill = "black"),
        plot.background =
          element_rect(fill = "black", color = "black"))
gg

# Barras: geom_col
# Mapeado: x --> year, y --> n (frecuencia)
# Color: rojo fijo
# Títulos, subtítulos y caption
# Fuente propia
# Tema: sin leyenda / fuentes y colores título
#       fondo de area de gráfica y general negra
#       grid: sin grid en el eje X, solo con grid principal fino en el y
gg <- gg +
  theme(panel.grid.major.y =
          element_line(size = 0.1, color = "white"),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank())
gg
  
# Barras: geom_col
# Mapeado: x --> year, y --> n (frecuencia)
# Color: rojo fijo
# Títulos, subtítulos y caption
# Fuente propia
# Tema: sin leyenda / fuentes y colores título
#       fondo de area de gráfica y general negra
#       grid: sin grid en el eje X, solo con grid principal fino en el y
#       fuente textos
font_add_google(family = "Permanent Marker",
                name = "Permanent Marker")
showtext_auto()
gg <- gg + 
  theme(plot.subtitle =
          element_text(family = "Permanent Marker",
                       size = 21, color = "white"),
        plot.caption =
          element_text(family = "Permanent Marker",
                       color = "white", size = 19),
        axis.text = 
          element_text(size = 15,
                       family = "Permanent Marker",
                       color = "white"))
gg
  
# Barras: geom_col
# Mapeado: x --> year, y --> n (frecuencia)
# Color: rojo fijo
# Títulos, subtítulos y caption
# Fuente propia
# Tema: sin leyenda / fuentes y colores título
#       fondo de area de gráfica y general negra
#       grid: sin grid en el eje X, solo con grid principal fino en el y
#       fuente textos
#       márgenes
gg <- gg +
theme(plot.margin =
        margin(t = 4, r = 4,
               b = 4, l = 8, "pt"))
gg


# Barras: geom_col
# Mapeado: x --> year, y --> n (frecuencia)
# Color: rojo fijo
# Títulos, subtítulos y caption
# Fuente propia
# Tema: sin leyenda / fuentes y colores título
#       fondo de area de gráfica y general negra
#       grid: sin grid en el eje X, solo con grid principal fino en el y
#       fuente textos
#       márgenes
#       anotaciones: texto y curva
gg <- gg +
  annotate("text", label = "(hasta enero)", x = 2021, y = 11,
           hjust = 0.3, vjust = 0, family = "Permanent Marker",
           size = 5, color='white', angle = 20) +
  annotate("curve", x = 2021, y = 9, xend = 2021, yend = 5,
           color = "white")
gg
