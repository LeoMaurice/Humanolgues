source("./src/preprocessing/nlp.R")

compute_dfm_lemmatized <- function(base, recompute = F, additional_remove = c(), lower_count = 0){
  
  lemmatized_corpus <- lemmatize(humanologues_base, recompute = recompute)
  
  dfm <- compute_word_freq_matrix(lemmatized_corpus, 
                                  additional_remove = additional_remove, lower_count = lower_count) # dfm stands for document frequency matrix car on calcul les frequence par doc
  
  return(dfm)
}