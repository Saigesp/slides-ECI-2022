# ----- Mosaicos o treemaps -----

# install.packages("treemapify")
library(treemapify)
library(MetBrewer)

# Filtramos ausentes en species
starwars_filtro <-
  starwars %>% drop_na(species)

# Recodificamos spcies: usamos fct_lump_min
# (del paquete forcats, ya cargado en tidyverse) para decirle
# que aquellas categorías con menos de 2 elementos, los 
# agrupe en "otras
starwars_filtro <-
  starwars_filtro %>%
  mutate(species =
           fct_lump_min(species, min = 2, other_level = "otras"))


# Tenemos a codificar área del cuadrado, color del relleno,
# y etiqueta a mostrar
ggplot(starwars_filtro %>%
           count(species),
       aes(area = n, fill = species, label = species)) +
  geom_treemap() + #<<
  scale_fill_manual(values = met.brewer("Renoir")) +
  labs(fill = "Especies")

# Con `geom_treemap_text()` podemos además escribir el
# nombre de los niveles
library(glue)
ggplot(starwars_filtro %>% count(species),
       aes(area = n, fill = species,
           label = glue("{species}: {n}"))) +
  geom_treemap() +
    geom_treemap_text(colour = "white",  place = "centre",
                      size = 17) +
    scale_fill_manual(values = met.brewer("Renoir")) +
    labs(fill = "Especies",
         title = "Especies en Starwars") +
    guides(fill = "none") + # eliminamos leyenda
    theme(plot.margin = margin(t = 10, r = 10, b = 10, l = 10))
    