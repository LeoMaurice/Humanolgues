# personnal_template

## Description succincte :
Racine du projet : Fichiers de configuration, documentation et dépendances.
- app/ : Applications spécifiques.
- data/ : Données organisées en brutes, intermédiaires et traitées, avec des sous-dossiers pour les fichiers volumineux au besoin.
- markdown/ : Quarto documents
- docs/ : Documentation générée du projet.
- src/ : Code source du projet avec des notebooks pour l'analyse interactive et un package principal contenant des helpers et utils.

## setup

## Arborescence du projet
```
personnal_template/
├───app                    # Contient les applications spécifiques développées dans le projet
│
├───data                   # Contient les données du projet
│   │
│   ├───intermediate       # Données intermédiaires résultant des processus de traitement
│   │   └───big            # Données intermédiaires volumineuses
│   │
│   ├───processed          # Données finales traitées
│   │   └───big            # Données traitées volumineuses
│   │
│   └───raw                # Données brutes non traitées│
├───docs                   # Documentation du projet
│   └───images             # Images utilisées dans la documentation
│
├───markdown               # Fichiers Markdown pour la documentation et les notes
│
├───site                   # Contient les fichiers du site web généré par le projet
│
├───src                    # Contient le code source du projet
│   ├───config             # Fichiers de configuration pour le projet
│   │
│   ├───features           # Implémentation des fonctionnalités spécifiques du projet
│   │
│   ├───loader             # Scripts et modules pour le chargement des données
│   │
│   │
│   ├───pipe               # Définition des pipelines de traitement de données
│   │
│   ├───preprocessing      # Scripts et modules pour la pré-traitement des données
│   │
│   ├───utils              # Fonctions utilitaires générales
```