# personnal_template

## Description succincte :
Racine du projet : Fichiers de configuration, documentation et dépendances.
- app/ : Applications spécifiques.
- data/ : Données organisées en brutes, intermédiaires et traitées, avec des sous-dossiers pour les fichiers volumineux.
- docs/ : Documentation générée du projet.
- models/ : Modèles organisés par type avec des sous-dossiers pour les modèles volumineux.
- site/ : Fichiers du site web généré.
- src/ : Code source du projet avec des notebooks pour l'analyse interactive et un package principal contenant des helpers et utils.
- tests/ : Tests du projet.
- vignettes/ et examples/ : Exemples documentés et tutoriels.

## setup

requirements.txt pour python pip
environment.yaml pour conda/mamba
setup.sh : bash ou git bash
setup.ps1 équivalent en powershell windows

il y a aussi ./src/config/load_libraries.R avec le téléchargement et l'installation des librairies R recommandées.

## .gitkeep
Simple convention pour avoir l'arborescence complète suivie par git.
Fichiers générés avec
```
Get-ChildItem -Directory -Recurse | Where-Object { $_.GetFileSystemInfos().Count -eq 0 } | ForEach-Object { New-Item -ItemType File -Path "$($_.FullName)\.gitkeep" }
```

## Guide pour bien nommer ses commits Git

Nommer correctement ses commits Git est crucial pour maintenir une histoire de projet claire et compréhensible. Voici quelques conseils pour rédiger des messages de commit utiles et concis :

### 1. Utiliser l'impératif présent

Les messages de commit doivent être rédigés à l'impératif présent, comme si vous donniez un ordre. Cela est en ligne avec le style des messages générés par Git pour des commandes comme `git merge`.

**Exemples :**
- ✅ `Add new user authentication`
- ❌ `Added new user authentication`

### 2. Être concis et descriptif

Le message de commit doit être court (50 caractères ou moins) et décrire précisément ce que le commit fait.

**Exemples :**
- ✅ `Fix bug in user login`
- ❌ `Fixed a bug that was causing issues when users tried to log in`

### 3. Utiliser un format standardisé

Adoptez un format standard pour les messages de commit afin de garder une consistance dans l'historique des commits. Un format courant est :
```
type: subject

body (optional)
```

**Types courants :**
- **feat** : Une nouvelle fonctionnalité
- **fix** : Une correction de bug
- **docs** : Des modifications à la documentation
- **style** : Des modifications qui ne touchent pas au code (espaces, formatage, etc.)
- **refactor** : Une refactorisation du code sans ajout de fonctionnalités ni correction de bugs
- **test** : Ajouter ou corriger des tests
- **chore** : Des mises à jour des outils et des bibliothèques

**Exemples :**
- ✅ `feat: add new login feature`
- ✅ `fix: resolve issue with user authentication`

### 4. Ajouter un corps de message si nécessaire

Si le commit nécessite plus d'explications, ajoutez une description dans le corps du message après une ligne vide. Utilisez le corps du message pour expliquer le "pourquoi" et non le "quoi".

**Exemples :**
```
fix: correct user login error

This fixes the issue where users were unable to log in due to incorrect
session handling. The session token is now properly validated before
proceeding.
```

### 5. Référencer des tickets ou des issues

Si le commit est lié à un ticket ou une issue, incluez une référence à celui-ci dans le message.

**Exemples :**
- ✅ `feat: add password reset feature (closes #123)`

### 6. Exemples de bons messages de commit

- `feat: implement user signup`
- `fix: correct typo in README`
- `docs: update API documentation`
- `style: format code according to PEP8`
- `refactor: reorganize project structure`
- `test: add unit tests for user model`
- `chore: update dependencies to latest versions`

## Arborescence du projet
```
personnal_template/
├───app                    # Contient les applications spécifiques développées dans le projet
│
├───data                   # Contient les données du projet
│   ├───external           # Données externes importées dans le projet
│   │   └───big            # Données externes volumineuses
│   │
│   ├───intermediate       # Données intermédiaires résultant des processus de traitement
│   │   └───big            # Données intermédiaires volumineuses
│   │
│   ├───processed          # Données finales traitées
│   │   └───big            # Données traitées volumineuses
│   │
│   └───raw                # Données brutes non traitées
│       └───big            # Données brutes volumineuses
│
├───docs                   # Documentation du projet
│   └───images             # Images utilisées dans la documentation
│
├───examples               # Contient des exemples d'utilisation du projet
│
├───markdown               # Fichiers Markdown pour la documentation et les notes
│
├───notebooks              # Notebooks pour l'exploration et l'analyse interactive
│
├───release                # Fichiers et informations relatifs aux versions publiées du projet
│
├───review                 # Contient les documents et scripts pour la revue de code ou de projet
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
│   ├───models             # Contient les modèles du projet
│   │   ├───econometrics   # Modèles économétriques
│   │   │   └───big        # Modèles économétriques volumineux
│   │   │
│   │   ├───LLM            # Modèles de grande taille (Large Language Models)
│   │   │   └───big        # Modèles LLM volumineux
│   │   │
│   │   ├───ML             # Modèles de machine learning
│   │   │   └───big        # Modèles ML volumineux
│   │   │
│   │   └───stats          # Modèles statistiques
│   │       └───big        # Modèles statistiques volumineux
│   │
│   ├───package            # Code principal du package
│   │   └───helpers        # Fonctions auxiliaires spécifiques à des tâches de traitement de données
│   │
│   ├───pipe               # Définition des pipelines de traitement de données
│   │
│   ├───preprocessing      # Scripts et modules pour la pré-traitement des données
│   │
│   ├───tests              # Contient les tests pour le code du projet
│   │
│   ├───utils              # Fonctions utilitaires générales
│   │
│   └───visualisation      # Scripts et modules pour la visualisation des données
│
├───temp                   # Fichiers temporaires générés par le projet
│
└───vignettes              # Contient des exemples documentés et des tutoriels sur l'utilisation du package
```