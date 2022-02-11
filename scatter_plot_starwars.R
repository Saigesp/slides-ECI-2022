# ----- scatter plot starwars -----


# Filtramos ausentes de peso, altura y color de ojos
starwars_filtro <-
 starwars %>%
 drop_na(c(mass, height, eye_color))

# Visualizamos scatter plot altura vs  peso
ggplot(starwars_filtro,
      aes(x = height, y = mass)) +
 geom_point()

# Visualizamos scatter plot altura vs  peso,
# con el tamaño en función del peso
ggplot(starwars_filtro,
      aes(x = height, y = mass, size = mass)) +
 geom_point()


# Transformar colores: recodificar variables
starwars_filtro <-
starwars_filtro %>%
mutate(eye_color =
        case_when(eye_color == "blue-gray" ~ "blue",
                  eye_color == "hazel" ~ "brown",
                  eye_color == "unknown" ~ "gray",
                  eye_color == "green, yellow" ~ "green",
                  TRUE ~ eye_color))

# Visualizamos scatter plot altura vs  peso,
# con el tamaño en función del peso, color en función de ojos
ggplot(starwars_filtro,
      aes(x = height, y = mass,
          size = mass, color = eye_color)) +
 geom_point() +
 scale_color_manual(values =
                      c("black", "blue", "brown", "gray",
                        "green", "orange", "red", "white", "yellow"))


# Localizamos el valor más pesado, su nombre y lo filtramos
starwars_filtro %>% slice_max(mass, n = 5) %>% pull(name)
starwars_filtro <-
  starwars_filtro %>%
  filter(name != "Jabba Desilijic Tiure")

# Visualizamos scatter plot altura vs  peso,
# con el tamaño en función del peso, color en función de ojos
# sin ese dato muy pesado
ggplot(starwars_filtro,
      aes(x = height, y = mass,
          size = mass, color = eye_color)) +
 geom_point() +
 scale_color_manual(values =
                      c("black", "blue", "brown", "gray",
                        "green", "orange", "red", "white",
                        "yellow"))

# Visualizamos scatter plot altura vs  peso,
# con el tamaño en función del peso, color en ojos
# eliminamos leyenda de tamaños
# añadimos título de leyenda a colores
ggplot(starwars_filtro,
      aes(x = height, y = mass,
          size = mass, color = eye_color)) +
 geom_point(alpha = 0.6) +
 guides(size = "none") + #<<
 scale_color_manual(values =
                      c("black", "blue", "brown", "gray", "green", "orange",
                        "red", "white",  "yellow")) +
 labs(color = "color de ojos") #<<

# Visualizamos scatter plot altura vs  peso,
# con el tamaño en función del peso, color en ojos
# eliminamos leyenda de tamaños
# añadimos título de leyenda a coloresç
# añadimos títulos, subtítulos, etc
ggplot(starwars_filtro,
      aes(x = height, y = mass,
          size = mass, color = eye_color)) +
 geom_point(alpha = 0.6) +
 guides(size = "none") +
 scale_color_manual(values =
                      c("black", "blue", "brown", "gray",
                        "green", "orange", "red", "white", "yellow")) +
 labs(color = "color de ojos",
      x = "altura (cm)",  y = "peso (kg)",
      title = "STARWARS",
      subtitle = "Diagrama de puntos altura vs peso",
      caption = "J. Álvarez Liébana | Datos: starwars")

# Visualizamos scatter plot altura vs  peso,
# con el tamaño en función del peso, color en ojos
# eliminamos leyenda de tamaños
# añadimos título de leyenda a colores
# añadimos títulos, subtítulos, etc
# personalizamos marcas de los ejes
ggplot(starwars_filtro,
      aes(x = height, y = mass,
          size = mass, color = eye_color)) +
 geom_point(alpha = 0.6) +
 guides(size = "none") +
 scale_color_manual(values =
                      c("black", "blue", "brown", "gray",
                        "green", "orange", "red", "white",
                        "yellow")) +
 scale_y_continuous(breaks = seq(20, 160, by = 20)) +
 scale_x_continuous(breaks =  seq(60, 240, by = 30)) +
 labs(color = "color de ojos",
      x = "altura (cm)", y = "peso (kg)",
      title = "STARWARS",
      subtitle = "Diagrama de puntos altura vs peso",
      caption = "J. Álvarez Liébana | Datos: starwars")
