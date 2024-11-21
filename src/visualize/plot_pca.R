library(FactoMineR)
library(factoextra)
library(ggplot2)
library(ggpubr)
library(dplyr)
library(tidyr)

# Fonction pour les sorties standard
pca_visualization <- function(pca_res, docvars) {
  # Projection des individus sur l'espace PCA
  proj_individuals <- function(pca_res, docvars, dims = c(1, 2)) {
    ind_data <- as.data.frame(pca_res$ind$coord[, dims]) %>%
      rename_with(~ paste0("Dim", dims), everything()) %>%
      mutate(Nom = docvars$Nom)
    x_var = paste0("Dim",dims[1])
    y_var = paste0("Dim",dims[2])
    ggplot(ind_data, aes_string(x = x_var, y = y_var, color = "Nom")) +
      geom_point(size = 3, alpha = 0.8) +
      geom_text(aes(label = Nom), vjust = -0.5, size = 3) +
      labs(
        title = paste("Projection sur les axes PCA", dims[1], "et", dims[2]),
        x = paste0("PCA ", dims[1], " (", round(pca_res$eig[dims[1], 2], 1), "%)"),
        y = paste0("PCA ", dims[2], " (", round(pca_res$eig[dims[2], 2], 1), "%)")
      ) +
      theme_pubclean()+
      theme(legend.position = "none")
  }
  
  # Pourcentage de représentation par axe
  plot_variance <- function(pca_res) {
    eig <- as.data.frame(pca_res$eig)
    eig$Axes <- seq_along(eig[, 1])
    
    ggplot(eig %>% slice(1:5), aes(x = Axes, y = `percentage of variance`)) +
      geom_bar(stat = "identity", fill = "steelblue", alpha = 0.8) +
      geom_text(aes(label = round(`percentage of variance`, 1)), vjust = -0.5) +
      labs(
        title = "Pourcentage de variance expliquée par axe",
        x = "Axes",
        y = "Pourcentage de variance"
      ) +
      theme_pubclean()
  }
  
  # Variables qui comptent le plus sur chaque axe
  plot_top_variables <- function(pca_res, dim = 1, top_n = 50) {
    var_data <- as.data.frame(pca_res$var$coord[, c(dim)]) %>%
      rename_with(~ paste0("Dim", dim), everything()) %>%
      mutate(Variable = rownames(pca_res$var$coord)) %>%
      pivot_longer(cols = starts_with("Dim"), names_to = "Dimension", values_to = "Contribution") %>%
      group_by(Dimension) %>%
      slice_max(order_by = Contribution, n = top_n, with_ties = FALSE) %>%
      bind_rows(
        .,
        group_by(as.data.frame(pca_res$var$coord[, c(dim)]) %>%
                   rename_with(~ paste0("Dim", dim), everything()) %>%
                   mutate(Variable = rownames(pca_res$var$coord)) %>%
                   pivot_longer(cols = starts_with("Dim"), names_to = "Dimension", values_to = "Contribution"),
                 Dimension) %>%
          slice_min(order_by = Contribution, n = top_n, with_ties = FALSE)
      ) %>%
      ungroup()
    
    ggplot(var_data, aes(x = reorder(Variable, Contribution), y = Contribution, fill = Dimension)) +
      geom_bar(stat = "identity", position = "dodge") +
      coord_flip() +
      labs(
        title = paste("Top et Bottom", top_n, "variables contributrices (Dim", dim, ")"),
        x = "Variables",
        y = "Contribution"
      ) +
      theme_pubclean()
  }
  
  
  plot_correlation_circle <- function(pca_res, dims = c(1, 2)) {
    # Extraire les coordonnées des variables pour les dimensions spécifiées
    var_data <- as.data.frame(pca_res$var$coord[, dims]) %>%
      rename_with(~ paste0("Dim", dims), everything()) %>%
      mutate(Variable = rownames(pca_res$var$coord))
    
    # Calculer le cercle unitaire
    circle <- data.frame(x = cos(seq(0, 2 * pi, length.out = 100)),
                         y = sin(seq(0, 2 * pi, length.out = 100)))
    x_var = paste0("Dim",dims[1])
    y_var = paste0("Dim",dims[2])
    ggplot() +
      geom_path(data = circle, aes(x = x, y = y), color = "gray") +
      geom_segment(data = var_data, aes(x = 0, y = 0, xend = Dim1, yend = Dim2), 
                   arrow = arrow(length = unit(0.2, "cm")), color = "steelblue") +
      geom_text(data = var_data, aes_string(x = x_var, y = y_var, label = "Variable"), 
                color = "darkred", hjust = 0.5, vjust = 1.5, size = 3) +
      labs(
        title = paste("Cercle des corrélations (Axes", dims[1], "et", dims[2], ")"),
        x = paste0("PCA ", dims[1], " (", round(pca_res$eig[dims[1], 2], 1), "%)"),
        y = paste0("PCA ", dims[2], " (", round(pca_res$eig[dims[2], 2], 1), "%)")
      ) +
      xlim(-1.1, 1.1) + ylim(-1.1, 1.1) +
      coord_fixed() +
      theme_pubclean()
  }
  
  # Génération des graphiques
  plots <- list(
    proj_1_2 = proj_individuals(pca_res, docvars, dims = c(1, 2)),
    proj_1_3 = proj_individuals(pca_res, docvars, dims = c(1, 3)),
    proj_2_3 = proj_individuals(pca_res, docvars, dims = c(2, 3)),
    plot_circle_1_2 = plot_correlation_circle(pca_res_humanologues, dims = c(1, 2)),
    plot_circle_1_3 = plot_correlation_circle(pca_res_humanologues, dims = c(1, 3)),
    plot_circle_2_3 = plot_correlation_circle(pca_res_humanologues, dims = c(2, 3)),
    variance = plot_variance(pca_res),
    top_vars_dim1 = plot_top_variables(pca_res, dim = 1, top_n = 25)
  )
  
  return(plots)
}