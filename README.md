# FlexPress Core

<p align="center">
  <a href="https://github.com/digitaleflex/flexpress-core/actions/workflows/docker-build.yml"><img src="https://github.com/digitaleflex/flexpress-core/actions/workflows/docker-build.yml/badge.svg" alt="Build, Scan & Push"></a>
  <a href="https://github.com/digitaleflex/flexpress-core/actions/workflows/integration-test.yml"><img src="https://github.com/digitaleflex/flexpress-core/actions/workflows/integration-test.yml/badge.svg" alt="Integration Tests"></a>
  <a href="https://github.com/digitaleflex/flexpress-core/actions/workflows/super-linter.yml"><img src="https://github.com/digitaleflex/flexpress-core/actions/workflows/super-linter.yml/badge.svg" alt="Linter"></a>
  <a href="https://github.com/digitaleflex/flexpress-core/actions/workflows/codeql-analysis.yml"><img src="https://github.com/digitaleflex/flexpress-core/actions/workflows/codeql-analysis.yml/badge.svg" alt="CodeQL Analysis"></a>
</p> - Infrastructure WordPress de Production

**FlexPress Core** est un socle d'infrastructure WordPress open-source, conteneurisé avec Docker et optimisé pour la production. Il fournit un environnement de développement et de déploiement robuste, sécurisé et performant, tout en offrant un contrôle total et une modularité maximale.

Ce projet est né de la nécessité d'avoir une solution qui se situe entre les hébergeurs gérés (souvent des "boîtes noires" rigides) et une configuration manuelle complexe. FlexPress Core offre la puissance d'une infrastructure sur mesure avec la simplicité de l'automatisation.

---

## ✨ Fonctionnalités Clés

-   **🚀 Performance Optimisée** : Construit avec Nginx, PHP-FPM et des optimisations de cache (OPcache, FastCGI Cache) pour des temps de réponse rapides.
-   **🛡️ Sécurité Renforcée** : Isolation des services, gestion automatisée des secrets, permissions de fichiers sécurisées par défaut et en-têtes de sécurité Nginx.
-   **🧩 Architecture Modulaire** : Un contrôle total sur votre stack. Ajoutez ou remplacez des composants facilement, sans être prisonnier d'une technologie.
-   **🤖 Automatisation & DX** : Scripts pour les tâches courantes (génération de `.env`, gestion des permissions), environnement reproductible avec Docker et configuration centralisée.
-   **📦 Prêt pour la Production** : Inclut des healthchecks pour chaque service, une gestion des logs et une structure pensée pour la stabilité et la maintenance.

---

## 🚀 Démarrage Rapide

Pour lancer votre environnement FlexPress Core, suivez ces étapes :

### 1. Prérequis

-   [Docker Engine](https://docs.docker.com/engine/install/)
-   [Docker Compose](https://docs.docker.com/compose/install/)
-   [Git](https://git-scm.com/downloads)

### 2. Cloner le Dépôt

```bash
git clone https://github.com/digitaleflex/flexpress-core.git
cd flexpress-core
```

### 3. Générer le Fichier de Configuration

Le projet utilise un fichier `.env` pour gérer toutes les configurations. Un script est fourni pour le générer automatiquement avec des mots de passe sécurisés.

```bash
# Sur Linux/macOS
chmod +x scripts/generate-env.sh
./scripts/generate-env.sh

# Sur Windows (PowerShell)
./scripts/generate-env.ps1
```

**Important :** Après la génération, ouvrez le fichier `.env` et **définissez votre mot de passe administrateur WordPress** pour la variable `WP_ADMIN_PASSWORD`.

### 4. Démarrer l'Infrastructure

Lancez l'ensemble des services avec Docker Compose.

```bash
docker compose up -d
```

Votre site WordPress est maintenant accessible ! Par défaut, vous pouvez le trouver à l'adresse `http://localhost:9000` (ou le port que vous avez configuré dans `.env`).

---

## 🛠️ Commandes Utiles

Une fois l'environnement démarré, voici quelques commandes utiles pour le gérer :

-   **Stopper tous les services :**
    ```bash
    docker compose down
    ```

-   **Consulter les logs en temps réel :**
    ```bash
    # Pour WordPress
    docker compose logs -f wordpress

    # Pour Nginx
    docker compose logs -f nginx
    ```

-   **Exécuter des commandes WP-CLI :**
    ```bash
    docker compose exec wordpress wp plugin list
    ```

-   **Ouvrir un shell dans le conteneur WordPress :**
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