# -----------------------------------------------------------
# WHO AFRO R Map Template - Main Script
# Author: Totah Terence
# Date: 2024-12-24
# -----------------------------------------------------------

# Charger les bibliothèques nécessaires et les scripts
source("Script/config_and_import.R")
source("Script/data_processing.R")
source("Script/visualization.R")

# -----------------------------------------------------------
# Configuration des paramètres dynamiques
# -----------------------------------------------------------

# Nom de la variable à représenter sur la carte
map_title <- "The title is here"

map_variable <- "leadership_class"

# Nom de la colonne utilisée pour fusionner les données (dans shapefile et Excel)
merge_column <- "ISO_3_CODE"

# Palette de couleurs pour la carte
color_palette <- c("yellow", "#ffffbe", "#feaf62", "#abdea3", "#347fc1")

# Chemin de sortie pour les cartes
output_dir <- "output/maps/"

# -----------------------------------------------------------
# Étapes principales
# -----------------------------------------------------------

# Étape 1 : Importation des données
shapefiles <- import_shapefiles(shapefile_dir)
data <- import_data(data_file, data_sheet)

# Étape 2 : Traitement des données
merged_data <- process_data(shapefiles$afro_region, data, merge_column)

# Étape 3 : Génération des cartes
generate_maps(
  shapefiles = shapefiles,
  merged_data = merged_data,
  map_variable = map_variable,
  color_palette = color_palette,
  output_dir = output_dir
)

