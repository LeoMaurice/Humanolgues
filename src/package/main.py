import argparse
from .utils import file_utils, data_utils
from .helpers import file_helpers, data_helpers

def main(args):
    # Exemple de logique principale du programme
    print("Initialisation du projet avec les arguments :", args)
    # Appeler des fonctions des modules utils
    data = data_utils.load_data(args.data_path)
    processed_data = data_utils.process_data(data)
    file_utils.save_data(processed_data, args.output_path)
    print("Traitement terminé et données sauvegardées.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Description de votre programme")
    parser.add_argument("--data_path", type=str, required=True, help="Chemin vers les données d'entrée")
    parser.add_argument("--output_path", type=str, required=True, help="Chemin pour sauvegarder les données traitées")
    
    args = parser.parse_args()
    main(args)
