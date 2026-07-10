# TogoLM Chatbot

[Français] | [English]

## Français

### Vision et Enjeux Majeurs

Le projet TogoLM Chatbot s'inscrit dans une démarche d'innovation technologique visant à répondre aux défis numériques contemporains du Togo et de la sous-région. Cette application ne se limite pas à être un simple outil de discussion ; elle porte une ambition de transformation numérique à travers quatre piliers essentiels :

*   **Souveraineté Numérique Togolaise** : En s'appuyant sur des infrastructures locales, nous garantissons l'indépendance technologique du pays face aux solutions propriétaires étrangères, assurant ainsi la maîtrise de nos propres données et de nos outils d'intelligence artificielle.
*   **Infrastructure TogoLM Open-Source** : L'application utilise TogoLM comme socle technologique fondamental. En tant que première infrastructure d'IA open-source au Togo, elle favorise la transparence, la collaboration communautaire et l'amélioration continue des modèles par les talents locaux.
*   **Émancipation des Développeurs et Utilisateurs** : Nous mettre à disposition des acteurs de la région des outils d'IA sur mesure, adaptés aux besoins spécifiques du marché local. Ce chatbot sert de preuve de concept pour stimuler la création d'un écosystème numérique dynamique et autonome.
*   **Accessibilité et Pertinence Culturelle** : L'IA est conçue pour comprendre et respecter les nuances linguistiques et culturelles locales. Elle offre une expérience utilisateur authentique, rendant la technologie accessible et utile pour tous, au-delà des barrières traditionnelles.

### Présentation
TogoLM Chatbot est un assistant de chat intelligent basé sur Flutter, propulsé par **TogoLM**, la première infrastructure d'IA open-source togolaise. Cette application permet aux utilisateurs de poser des questions sur le Togo et d'obtenir des réponses précises via un modèle de langage souverain.

### Fonctionnalités
- **Intégration TogoLM** : Utilisation de l'API native TogoLM pour des réponses contextuelles sur le Togo.
- **Historique Persistant** : Sauvegarde locale des conversations sur l'appareil.
- **Interface Intuitive** : Design moderne inspiré des couleurs du drapeau togolais.
- **Sécurité** : Gestion des clés API via des variables d'environnement.

### Stack Technique
- **Framework** : Flutter (dans le dossier `chat_bot`)
- **Gestion d'état** : Riverpod
- **API** : TogoLM Service (via `http`)
- **Stockage Local** : `shared_preferences`
- **Configuration** : `flutter_dotenv`

### Installation
1.  Clonez le dépôt.
2.  Dans le dossier `chat_bot`, créez un fichier `.env`.
3.  Ajoutez votre clé API : `TOGOLM_API_KEY=votre_cle_ici`.
4.  Exécutez `flutter pub get` dans le dossier `chat_bot`.
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
- **Framework**: Flutter (located in `chat_bot` directory)
- **State Management**: Riverpod
- **API**: TogoLM Service (via `http`)
- **Local Storage**: `shared_preferences`
- **Configuration**: `flutter_dotenv`

### Setup Instructions
1.  Clone the repository.
2.  Inside the `chat_bot` folder, create a `.env` file.
3.  Add your API key: `TOGOLM_API_KEY=your_key_here`.
4.  Run `flutter pub get` inside the `chat_bot` directory.
5.  Launch the app with `flutter run`.

### Security Note
This project uses `.env` files to store sensitive credentials. Ensure your `.env` is never committed to version control.
