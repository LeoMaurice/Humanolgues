# Chargez les bibliothèques nécessaires
library(pdftools)
library(quanteda)

# Fonction pour lire tous les PDF d'un dossier et les stocker dans un data.frame
read_pdfs_from_folder <- function(folder_path) {
  # Liste de tous les fichiers PDF dans le dossier
  pdf_files <- list.files(folder_path, pattern = "\\.pdf$", full.names = TRUE)
  
  # Initialiser une liste pour stocker les résultats
  result <- data.frame(file_name = character(), text = character(), stringsAsFactors = FALSE)
  
  # Boucle pour lire chaque fichier PDF
  for (pdf_path in pdf_files) {
    if (file.exists(pdf_path)) {
      # Lire le texte du PDF
      pdf_text <- paste(pdf_text(pdf_path), collapse = " ")
      # Ajouter les données au résultat
      result <- rbind(result, data.frame(file_name = basename(pdf_path), text = pdf_text, stringsAsFactors = FALSE))
    } else {
      warning(paste("Le fichier", pdf_path, "n'existe pas."))
    }
  }
  
  return(result%>%
           mutate(doc_id = as.character(row_number())))
}