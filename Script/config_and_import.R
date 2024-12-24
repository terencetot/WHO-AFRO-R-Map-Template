# -----------------------------------------------------------
# Configuration et Importation
# -----------------------------------------------------------

# Bibliothèques nécessaires

if (!require("ggplot2")) install.packages("ggplot2")
if (!require("dplyr")) install.packages("dplyr")
if (!require("sf")) install.packages("sf")
if (!require("tmap")) install.packages("tmap")
if (!require("readxl")) install.packages("readxl")
if (!require("tidyverse")) install.packages("tidyverse")
if (!require("janitor")) install.packages("janitor")
if (!require("stringr")) install.packages("stringr")


srcdir <- getSrcDirectory(function(){})[1]

# Fallback to RStudio API if getSrcDirectory doesn't work
if (srcdir == "" || is.null(srcdir)) {
  # Check if RStudio API is available
  if (requireNamespace("rstudioapi", quietly = TRUE)) {
    # Use RStudio API to get the script's active document path
    srcdir <- dirname(rstudioapi::getActiveDocumentContext()$path)
  } else {
    stop("Unable to retrieve script directory. Ensure you are using RStudio or call this script in a context where the path can be detected.")
  }
}

setwd(dirname(srcdir))

# Chemins des fichiers
shapefile_dir <- "data/shapefiles/"
data_file <- "data/data_example.xlsx"
data_sheet <- "CCS2"

# Importation des shapefiles
import_shapefiles <- function(dir) {
  list(
    afrique = st_read(file.path(dir, "AFRICAN CONTINENT.shp")),
    afro_region = st_read(file.path(dir, "AFRIQUE_AFRO.shp")),
    disputed_area = st_read(file.path(dir, "DISPUTED AREAS AFRO.shp"))
  )
}

# Importation des données Excel
import_data <- function(file, sheet) {
  read_excel(file, sheet = sheet) %>%
    clean_names() %>%
    mutate(ISO_3_CODE = str_to_lower(iso_3digit))
}
