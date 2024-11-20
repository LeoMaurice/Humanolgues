# Charger pacman pour la gestion des packages
require(pacman, quietly = T)

# Chargement des packages avec pacman
pacman::p_load(
  # Gestion des fichiers et des formats de données
  arrow,
  openxlsx,
  
  # Manipulation et transformation des données
  tidyverse,
  reshape2,
  stringr,
  DT,
  
  # Statistiques
  stats,
  rstatix,
  
  # Visualisation de données
  ggplot2,
  gridExtra,
  ggprism,
  ggpubr,
  ggcorrplot,
  ggraph,
  ggrepel,
  paletteer,
  patchwork,
  
  # Graphes et réseaux
  igraph,
  tidygraph,
  #visNetwork,
  
  # Production de rapports et documents
  rmarkdown,
  knitr,
  kableExtra,
  
  # Autres utilitaires
  lubridate, # Gestion des dates
  janitor,   # Nettoyage des données
  here,      # Gestion des chemins de fichiers
  magrittr   # Pour l'opérateur pipe %>%
)

# Messages de confirmation
cat("Toutes les bibliothèques ont été chargées avec succès.")
