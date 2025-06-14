# FlexPress Core

<p align="center">
  <a href="https://github.com/digitaleflex/flexpress-core/actions/workflows/docker-build.yml"><img src="https://github.com/digitaleflex/flexpress-core/actions/workflows/docker-build.yml/badge.svg" alt="Build, Scan & Push"></a>
  <a href="https://github.com/digitaleflex/flexpress-core/actions/workflows/super-linter.yml"><img src="https://github.com/digitaleflex/flexpress-core/actions/workflows/super-linter.yml/badge.svg" alt="Linter"></a>
  <a href="https://img.shields.io/github/license/digitaleflex/flexpress-core"><img src="https://img.shields.io/github/license/digitaleflex/flexpress-core" alt="License"></a>
</p>

<p align="center">
  <strong>Une infrastructure WordPress de Production, open-source et sur mesure.</strong>
</p>

---

FlexPress Core est un socle d'infrastructure WordPress open-source, conteneurisé avec Docker et optimisé pour la production. Il fournit un environnement de développement et de déploiement robuste, sécurisé et performant, tout en offrant un contrôle total et une modularité maximale.

Ce projet se situe entre les hébergeurs gérés (souvent des "boîtes noires" rigides) et une configuration manuelle complexe. FlexPress Core offre la puissance d'une infrastructure sur mesure avec la simplicité de l'automatisation.

## 📋 Table des matières

1.  [✨ Fonctionnalités](#-fonctionnalités)
2.  [🛠️ Stack Technique](#-stack-technique)
3.  [🚀 Démarrage Rapide](#-démarrage-rapide)
4.  [⚙️ Utilisation](#-utilisation)
5.  [📁 Structure du Projet](#-structure-du-projet)
6.  [🤖 CI/CD](#-cicd)
7.  [🤝 Contribution](#-contribution)
8.  [📜 Licence](#-licence)

## ✨ Fonctionnalités

-   **🚀 Performance Optimisée** : Construit avec Nginx, PHP-FPM et des optimisations de cache pour des temps de réponse rapides.
-   **🛡️ Sécurité Renforcée** : Isolation des services, gestion automatisée des secrets via un script, permissions de fichiers sécurisées et en-têtes de sécurité Nginx.
-   **🧩 Architecture Modulaire** : Un contrôle total sur votre stack. Ajoutez ou remplacez des composants facilement.
-   **🤖 Automatisation & DX** : Scripts pour les tâches courantes, environnement reproductible avec Docker et configuration centralisée.
-   **📦 Prêt pour la Production** : Inclut des healthchecks pour chaque service, une gestion des logs et une structure pensée pour la stabilité.
-   **🔄 CI/CD Intégrée** : Workflows GitHub Actions pour le linting, les scans de sécurité (Trivy) et le build/push automatique des images Docker avec versioning sémantique.

## 🛠️ Stack Technique

*   **Serveur Web :** [Nginx](https://www.nginx.com/)
*   **Application :** [WordPress](https://wordpress.org/) (via l'image officielle)
*   **Base de données :** [MySQL](https://www.mysql.com/)
*   **Conteneurisation :** [Docker](https://www.docker.com/) & [Docker Compose](https://docs.docker.com/compose/)

## 🚀 Démarrage Rapide

Suivez ces étapes pour lancer votre environnement FlexPress Core en quelques minutes.

### Prérequis

Assurez-vous d'avoir les outils suivants installés sur votre machine :
*   [Git](https://git-scm.com/downloads)
*   [Docker Engine](https://docs.docker.com/engine/install/)
*   [Docker Compose](https://docs.docker.com/compose/install/) (généralement inclus avec Docker Desktop)

### Installation

1.  **Clonez le dépôt :**
    ```bash
    git clone https://github.com/digitaleflex/flexpress-core.git
    cd flexpress-core
    ```

2.  **Générez le fichier de configuration :**
    Le projet utilise un fichier `.env` pour gérer toutes les configurations (ports, mots de passe, etc.). Un script est fourni pour le générer automatiquement avec des secrets sécurisés.

    *Exécutez cette commande depuis un terminal compatible Bash (comme Git Bash sur Windows).* 
    ```bash
    ./scripts/generate-env.sh
    ```
    Ce script crée un fichier `.env` à la racine du projet. Vous pouvez l'éditer si vous souhaitez personnaliser les ports ou d'autres configurations.

3.  **Démarrez l'infrastructure :**
    Lancez l'ensemble des services en arrière-plan.
    ```bash
    docker compose up -d
    ```

Votre site WordPress est maintenant accessible ! Par défaut, vous pouvez le trouver à l'adresse [http://localhost:9000](http://localhost:9000) (ou le port que vous avez configuré dans `.env`).

## ⚙️ Utilisation

Voici quelques commandes utiles pour gérer votre environnement.

| Commande                               | Description                                             |
| -------------------------------------- | ------------------------------------------------------- |
| `docker compose down`                  | Stoppe et supprime tous les conteneurs.                 |
| `docker compose down -v`               | Stoppe et supprime les conteneurs ET les volumes (données). |
| `docker compose logs -f wordpress`     | Affiche les logs du conteneur WordPress en temps réel.  |
| `docker compose exec wordpress bash`   | Ouvre un terminal `bash` dans le conteneur WordPress.   |
| `docker compose exec wordpress wp ...` | Exécute une commande [WP-CLI](https://wp-cli.org/).     |

**Exemple WP-CLI :** Lister les plugins installés.
```bash
docker compose exec wordpress wp plugin list
```

## 📁 Structure du Projet

```
flexpress-core/
├── .github/                # Workflows GitHub Actions (CI/CD)
├── config/
│   ├── nginx/              # Configuration Nginx
│   └── php/                # Configuration PHP (uploads.ini)
├── scripts/
│   ├── generate-env.sh     # Script de génération du .env
│   └── init-mysql.sh       # Script d'initialisation de la base de données
├── wordpress/              # Fichiers WordPress (thèmes, plugins)
├── .gitignore
├── docker-compose.yml      # Fichier d'orchestration des services Docker
├── Dockerfile              # Définition de l'image WordPress personnalisée
└── README.md
```

## 🤖 CI/CD

Le projet intègre un pipeline CI/CD complet via GitHub Actions :

1.  **Linting (`super-linter.yml`)** : Analyse statique du code pour garantir la qualité et la cohérence sur chaque `push`.
2.  **Build, Scan & Push (`docker-build.yml`)** :
    -   **Construit** les images Docker pour les services.
    -   **Scanne** l'image WordPress avec [Trivy](https://github.com/aquasecurity/trivy) pour détecter les vulnérabilités.
    -   **Pousse** les images vers Docker Hub avec un versioning intelligent :
        -   `latest` pour chaque push sur `main`.
        -   Tags sémantiques (ex: `1.0.0`, `1.0`) pour chaque tag Git `v*` poussé.

## 🤝 Contribution

Les contributions sont les bienvenues ! Si vous souhaitez améliorer FlexPress Core, veuillez suivre ces étapes :
1.  Forkez le projet.
2.  Créez une nouvelle branche (`git checkout -b feature/nouvelle-fonctionnalite`).
3.  Commitez vos changements (`git commit -m 'feat: ajoute une nouvelle fonctionnalité'`).
4.  Poussez vers la branche (`git push origin feature/nouvelle-fonctionnalite`).
5.  Ouvrez une Pull Request.

## 📜 Licence

Ce projet est distribué sous la **Licence MIT**. Consultez le fichier `LICENSE` pour plus de détails.
    ```bash
    docker compose exec wordpress sh
    ```

---

## 🚑 Dépannage

-   **Erreur : "Port is already allocated"**
    -   **Cause :** Un autre service sur votre machine utilise le port défini pour Nginx (par défaut `9000`).
    -   **Solution :** Modifiez la variable `NGINX_PORT` dans votre fichier `.env` pour un autre port (ex: `9001`) et redémarrez avec `docker compose up -d`.

---

## 📚 Documentation

La documentation complète du projet se trouve dans le dossier `docs/` :

-   **[Guide de Configuration](docs/CONFIGURATION.md)** : Pour un aperçu détaillé de toutes les options de configuration.
-   **[Documentation d'Architecture](docs/ARCHITECTURE.md)** : Pour comprendre le fonctionnement interne des services.
-   **[Guide de Sécurité](docs/SECURITY.md)** : Pour comprendre les mesures de sécurité intégrées.
-   **[Feuille de Route (Roadmap)](docs/ROADMAP.md)** : Pour voir les futures évolutions du projet.
-   **[Changelog](CHANGELOG.md)** : Pour suivre l'historique des changements.

---

## 🤝 Contribution

Nous accueillons avec plaisir les contributions de la communauté !

Avant de commencer, veuillez consulter notre **[Guide de Contribution](docs/CONTRIBUTING.md)** et notre **[Code de Conduite](docs/CODE_OF_CONDUCT.md)** pour comprendre les règles et le processus de soumission.

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

---

Développé avec ❤️ par [eflexcloud](https://github.com/digitaleflex). 