# TogoLM Chatbot

[Français] | [English]

## Français

### Présentation
TogoLM Chatbot est un assistant de chat intelligent basé sur Flutter, propulsé par **TogoLM**, la première infrastructure d'IA open-source togolaise. Cette application permet aux utilisateurs de poser des questions sur le Togo et d'obtenir des réponses précises via un modèle de langage souverain.

### Fonctionnalités
- **Intégration TogoLM** : Utilisation de l'API native TogoLM pour des réponses contextuelles sur le Togo.
- **Historique Persistant** : Sauvegarde locale des conversations sur l'appareil.
- **Interface Intuitive** : Design moderne inspiré des couleurs du drapeau togolais.
- **Sécurité** : Gestion des clés API via des variables d'environnement.

### Stack Technique
- **Framework** : Flutter
- **Gestion d'état** : Riverpod
- **API** : TogoLM Service (via `http`)
- **Stockage Local** : `shared_preferences`
- **Configuration** : `flutter_dotenv`

### Installation
1.  Clonez le dépôt.
2.  Dans le dossier `chat_bot`, créez un fichier `.env`.
3.  Ajoutez votre clé API : `TOGOLM_API_KEY=votre_cle_ici`.
4.  Exécutez `flutter pub get`.
5.  Lancez l'application avec `flutter run`.

---

## English

### Presentation
TogoLM Chatbot is an intelligent chat assistant built with Flutter, powered by **TogoLM**, the first Togolese open-source AI infrastructure. This application enables users to ask questions about Togo and receive accurate answers through a sovereign language model.

### Features
- **TogoLM Integration**: Uses the native TogoLM API for contextual responses about Togo.
- **Persistent History**: Conversations are saved locally on the device.
- **Intuitive Interface**: Modern design inspired by the colors of the Togolese flag.
- **Security**: API key management via environment variables.

### Tech Stack
- **Framework**: Flutter
- **State Management**: Riverpod
- **API**: TogoLM Service (via `http`)
- **Local Storage**: `shared_preferences`
- **Configuration**: `flutter_dotenv`

### Setup Instructions
1.  Clone the repository.
2.  Inside the `chat_bot` folder, create a `.env` file.
3.  Add your API key: `TOGOLM_API_KEY=your_key_here`.
4.  Run `flutter pub get`.
5.  Launch the app with `flutter run`.

### Security Note
This project uses `.env` files to store sensitive credentials. Ensure your `.env` is never committed to version control.
