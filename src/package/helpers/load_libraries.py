# Importation des bibliothèques classiques

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from tqdm import tqdm

# Initialisation des paramètres de configuration pour les bibliothèques

def init_libraries():
    # Configurer pandas pour afficher toutes les colonnes
    pd.set_option('display.max_columns', None)
    pd.set_option('display.max_rows', None)
    
    # Configurer matplotlib pour les graphiques inline dans les notebooks
    plt.style.use('ggplot')
    
    
    print("Libraries loaded and configured.")

# Appeler la fonction d'initialisation
init_libraries()
