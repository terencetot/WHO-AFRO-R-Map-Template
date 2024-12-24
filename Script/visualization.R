# -----------------------------------------------------------
# Fonction pour générer une carte de l'Afrique avec une variable choisie
# -----------------------------------------------------------

generate_maps <- function(shapefiles, merged_data, map_variable, color_palette, output_dir) {
  # Vérification ou création du répertoire de sortie
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }
  tmap_options(check.and.fix = TRUE)
  
  # Générer la carte pour l'Afrique entière
  map <- tm_shape(shapefiles$afrique) +
    tm_polygons(
      col = "white",
      border.col = "black",
      alpha = 0.5
    ) +
    tm_shape(shapefiles$afro_region) +
    tm_polygons(
      col = "green",
      border.col = "black",
      alpha = 0.5
    ) +
    tm_shape(merged_data) +
    tm_polygons(
      col = map_variable,
      palette = color_palette,
      title = paste( map_variable)
    ) +
    tm_shape(shapefiles$disputed_area) +
    tm_polygons(
      col = "grey",
      border.col = "black",
      alpha = 0.5
    ) +
    tm_layout(
      main.title = map_title,
      main.title.size = 1.5,
      main.title.position = "center",
      legend.position = c(0.04, 0.27),
      legend.bg.color = "white",
      legend.bg.alpha = 0.1,
      legend.title.size = 1.2,
      legend.title.fontface = "bold",
      legend.text.size = 0.8,
      frame = FALSE,
      fontfamily = "Trebuchet MS"
    ) +
    tm_scale_bar(
      breaks = c(0, 1500, 3000),
      text.size = 0.5,
      position = c("right", "bottom")
    ) +
    tm_logo(
      "Location.png",
      height = 5,
      position = c(0.75, 0.75)
    ) +
    tm_credits(
      text = paste(
        "Data Sources: ",
        "Map Production: UCN/NCD",
        "Regional Office for Africa",
        "World Health Organization",
        "© WHO 2025. All rights reserved.",
        sep = "\n"
      ),
      size = 0.75,
      fontfamily = "Trebuchet MS",
      position = c("left", "bottom")
    )
  map
}

