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
  gridExtra,# asbent portail
  ggprism,# asbent portail
  ggpubr,
  ggcorrplot,# asbent portail
  ggraph,# asbent portail
  ggrepel,
  paletteer,# asbent portail
  patchwork,
  
  # Production de rapports et documents
  rmarkdown,
  knitr,
  kableExtra,
  
  # Autres utilitaires
  lubridate, # Gestion des dates
  janitor,   # Nettoyage des données # asbent portail
  here,      # Gestion des chemins de fichiers
  magrittr,   # Pour l'opérateur pipe %>%
  readxl,
  writexl,
  qs, # asbent portail
  reticulate,

  # NLP
  quanteda, # asbent portail
  quanteda.textstats, # asbent portail
  quanteda.textplots,# asbent portail
  spacyr,# asbent portail
  pdftools,# asbent portail
  tidytext, # installé, non fonctionnel portail
  
  # PCA
  FactoMineR,# asbent portail
  factoextra,# asbent portail
  Factoshiny,# asbent portail
  robustbase,
  rrcov
  
)

# spacy_install() # to execute only the first time
# spacy_download_langmodel(lang_models = 'fr_core_news_sm')

# Messages de confirmation
cat("Toutes les bibliothèques ont été chargées avec succès.")
