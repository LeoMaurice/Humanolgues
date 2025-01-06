library(quanteda)
library(quanteda.textstats)
library(spacyr)
library(qs)

lemmatize <- function(base, recompute = F){
  corpus_parsed_file = "./src/models/spacy/parsed_humanologues_corpus.qs"

  cp <- corpus(
    base$text,
    docvars = select(base,file_name, Nom, Source, Date),
    docnames = base$doc_id
    )
  if(recompute){
    spacy_initialize(model = "fr_core_news_sm")
    parsed <- spacy_parse(cp, 
                          lemma = T,
                          entity = T,
                          dependency = F,
                          nounphrase = F)
    spacy_finalize()
    
    group_parsed <- parsed %>%
      group_by(doc_id)%>%
      summarise(lemmatized_text = paste(lemma, collapse = " "))%>%
      left_join(
      base%>%select(doc_id,file_name,Nom, Source, Date),
      by ="doc_id"
    )
    qsave(group_parsed, file = corpus_parsed_file)
  } else {
    group_parsed <- qread(file = corpus_parsed_file)
  }
  
  corpus(
    group_parsed$lemmatized_text,
    docvars = select(group_parsed,file_name, Nom, Source, Date),
    docnames = group_parsed$doc_id
  )
}

# Fonction pour calculer la matrice de fréquence des mots par documents
compute_word_freq_matrix <- function(lemmatized_corpus, additional_remove = c(),lower_count = 0) {
  # Extraction des lemmes sans les stop words
  spacy_initialize(model = "fr_core_news_sm")
  to_remove <- c(stopwords("fr"), "", additional_remove,
                 "a", "a-til", "afin", "ainsi", "alors", "août", "après", "aucun", "aucune", "au-delà", "aujourd", "auprès", 
                 "aussi", "autant", "autour", "autre", "autres", "avant", "avoir", "beaucoup", "car", "celle", "celle-ci", "celui", 
                 "celui-ci", "certains", "ci", "chaque", "chez", "comme", "depuis", "delà","deux", "devant", "dix", "dizaine", "donc", "dont", 
                 "dès", "déjà", "désormais", "elles", "encore", "enfin", "ensuite", "finalement", "février", "guère", "hier", "hui", 
                 "jamais", "jusqu", "juste", "laquelle", "lequel", "lors", "mai", "mars", "moins", "nombreuses", "non", "notamment", 
                 "outre", "parce", "parmi", "peu", "peut-être", "plus", "plusieurs", "pris", "probablement", "près", "puis", "puisqu", 
                 "quand", "quant", "quatre", "quelques", "quil", "récemment", "selon", "sept", "seul", "seulement", "simple", "sir", 
                 "sous", "telle", "tous", "tout", "toute", "trente", "trois", "très", "vers", "vingt", "vingtaine", "également",
                 "si", "fait", "être")
  lemmatized_tokens <- lemmatized_corpus%>%
    tokens(remove_punct = TRUE, remove_numbers = TRUE, remove_symbols = TRUE)%>%
    tokens_remove(to_remove)
  # Création d'un document-feature matrix (dfm) à partir des données parsées
  dfm <- lemmatized_tokens %>%
    dfm(tolower = TRUE)%>%   # Conversion en minuscules
    dfm_trim(min_termfreq = lower_count)

  
  spacy_finalize()
  
  return(dfm)
}

library(tidytext)

tidy_dfm_with_docvars <- function(dfm){
  tidy(dfm)%>%
    left_join(
      dfm@docvars%>%
        rename(document = docname_)%>%
        select(document,
               Nom,Source,Date),
      by = "document"
    )%>%
    mutate(document = as.numeric(document))%>%
    arrange(document)
}