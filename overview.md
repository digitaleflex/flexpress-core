# FlexPress Core - Infrastructure WordPress de Production

![FlexPress Core](https://raw.githubusercontent.com/digitaleflex/flexpress-core/main/docs/assets/flexpress-banner.png) <!-- Vous pouvez ajouter une bannière ici -->

**FlexPress Core** est un socle d'infrastructure WordPress open-source, conteneurisé avec Docker et optimisé pour la production. Il fournit un environnement de développement et de déploiement robuste, sécurisé et performant, tout en offrant un contrôle total et une modularité maximale.

Ce projet est né de la nécessité d'avoir une solution qui se situe entre les hébergeurs gérés (souvent des "boîtes noires" rigides) et une configuration manuelle complexe. FlexPress Core offre la puissance d'une infrastructure sur mesure avec la simplicité de l'automatisation.

> **Dépôt GitHub :** [https://github.com/digitaleflex/flexpress-core](https://github.com/digitaleflex/flexpress-core)

---

## ✨ Fonctionnalités Clés

-   **🚀 Performance Optimisée** : Construit avec Nginx, PHP-FPM et des optimisations de cache (OPcache, FastCGI Cache) pour des temps de réponse rapides.
-   **🛡️ Sécurité Renforcée** : Isolation des services, gestion automatisée des secrets, permissions de fichiers sécurisées par défaut et en-têtes de sécurité Nginx.
-   **🧩 Architecture Modulaire** : Un contrôle total sur votre stack. Ajoutez ou remplacez des composants (comme Redis, Varnish, etc.) facilement, sans être prisonnier d'une technologie.
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

Clonez le projet depuis GitHub, qui contient le fichier `docker-compose.yml` et toutes les configurations nécessaires.

```bash
git clone https://github.com/digitaleflex/flexpress-core.git
cd flexpress-core
```

### 3. Générer le Fichier de Configuration

Le projet utilise un fichier `.env` pour gérer toutes les configurations sensibles et spécifiques à l'environnement. Un script est fourni pour le générer automatiquement avec des mots de passe sécurisés.

```bash
# Donnez les permissions d'exécution au script
chmod +x scripts/generate-env.sh

# Exécutez le script
./scripts/generate-env.sh
```

**Important :** Après la génération, ouvrez le fichier `.env` et **définissez votre mot de passe administrateur WordPress** pour la variable `WP_ADMIN_PASSWORD`.

### 4. Démarrer l'Infrastructure

Lancez l'ensemble des services avec Docker Compose.

```bash
docker compose up -d
```

Votre site WordPress est maintenant accessible ! Par défaut, vous pouvez le trouver à l'adresse `http://localhost:9000` (ou le port que vous avez configuré dans `.env`).

---

## ⚙️ Configuration

Toute la configuration de l'environnement est gérée via le fichier `.env`. Vous pouvez y ajuster :
-   Les ports Nginx (`NGINX_PORT`)
-   Les informations du site WordPress (`WP_TITLE`, `WP_URL`, etc.)
-   Les identifiants de l'administrateur (`WP_ADMIN_USER`, `WP_ADMIN_PASSWORD`, `WP_ADMIN_EMAIL`)
-   Les limites PHP (`PHP_MEMORY_LIMIT`, `PHP_UPLOAD_MAX_FILESIZE`, etc.)

Pour des configurations plus avancées (PHP, MySQL, Nginx), veuillez consulter les fichiers dans le répertoire `config/`.

---

## 📚 Documentation

-   **[Guide de Configuration Complet](https://github.com/digitaleflex/flexpress-core/blob/main/docs/CONFIGURATION.md)** : Pour un aperçu détaillé de toutes les options de configuration.
-   **[Documentation d'Architecture](https://github.com/digitaleflex/flexpress-core/blob/main/docs/ARCHITECTURE.md)** : Pour comprendre le fonctionnement interne des services.
-   **[Feuille de Route (Roadmap)](https://github.com/digitaleflex/flexpress-core/blob/main/docs/ROADMAP.md)** : Pour voir les futures évolutions du projet.

---

## Tags Supportés

-   `1.0`, `latest`

---

Développé avec ❤️ par [eflexcloud](https://github.com/digitaleflex). N'hésitez pas à ouvrir une issue ou une pull request !
