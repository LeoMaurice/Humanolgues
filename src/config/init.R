# Charger les packages nécessaires
source("./src/config/load_libraries.R")

# Charger les fonctions principales
source("./src/utils/file_utils.R")
source("./src/utils/data_utils.R")
source("./src/preprocessing/nlp.R")
source("./src/preprocessing/pca_on_freq.R")
source("./src/pipe/lexicometrie.R")
source("./src/pipe/pca.R")
source("./src/visualize/plot_pca.R")

# Fonction d'initialisation
init_project <- function() {
  cat("Project initialized and all libraries loaded.\n")
}
