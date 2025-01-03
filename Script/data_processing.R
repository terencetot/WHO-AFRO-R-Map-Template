# -----------------------------------------------------------
# Traitement des Donn�es
# -----------------------------------------------------------

# Nettoyer et fusionner les donn�es
process_data <- function(afro_region, data, merge_column) {
  afro_region %>%
    mutate(merge_column = str_to_lower(.data[[merge_column]])) %>%
    left_join(data, by = c("merge_column" = merge_column))
}
