# Charger pacman pour la gestion des packages
require(pacman, quietly = T)

# Chargement des packages avec pacman
pacman::p_load(
  # Manipulation et transformation des données
  tidyverse,
  reshape2,
  stringr,
  DT,
  dtplyr,
  
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
  
  # Production de rapports et documents
  rmarkdown,
  knitr,
  kableExtra,
  
  # Autres utilitaires
  lubridate, # Gestion des dates
  janitor,   # Nettoyage des données
  here,      # Gestion des chemins de fichiers
  magrittr,   # Pour l'opérateur pipe %>%
  readxl,
  writexl,
  qs,
  reticulate,

  # NLP
  quanteda,
  quanteda.textstats,
  quanteda.textplots,
  spacyr,
  pdftools,
  tidytext,
  
  # PCA
  FactoMineR,
  factoextra,
  Factoshiny,
  robustbase,
  rrcov
  
)

# spacy_install() to execute only the first time
# spacy_download_langmodel(lang_models = 'fr_core_news_sm')

# Messages de confirmation
cat("Toutes les bibliothèques ont été chargées avec succès.")
