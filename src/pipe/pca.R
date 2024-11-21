library(tidyverse)
library(FactoMineR)
library(factoextra)

# PCA data
prepepare_pca_data <- function(df){
  # Étape 1 : Mise en format large
  df_wide <- prepare_pca_data(df)
  
  # Étape 2 : Normalisation
  df_normalized <- normalize_frequencies(df_wide)
  
  return(df_normalized)
}

# Pipeline complet
perform_pca_pipeline <- function(df, df_normalized = data.frame(), robust = F) {
  # Etape 1 et 2
  if(is_empty(df_normalized)){
    df_normalized <- prepepare_pca_data(df)
  }
  
  # Étape 3 : PCA
  pca_res <- perform_pca(df_normalized, robust = robust)
  
  
  return(pca_res)
}
