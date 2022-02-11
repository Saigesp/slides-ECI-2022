# ----- Nubes de palabras -----

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


# install.packages("wordcloud2")
library(wordcloud2)
wordcloud2(starwars_filtro %>% # contamos número en cada especie
             count(species),
           size = 0.8, color= 'random-dark')

