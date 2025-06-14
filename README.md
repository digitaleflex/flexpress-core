# FlexPress Core - Infrastructure WordPress de Production

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

## 📚 Documentation

-   **[Guide de Configuration](docs/CONFIGURATION.md)** : Pour un aperçu détaillé de toutes les options de configuration.
-   **[Documentation d'Architecture](docs/ARCHITECTURE.md)** : Pour comprendre le fonctionnement interne des services.
-   **[Feuille de Route (Roadmap)](docs/ROADMAP.md)** : Pour voir les futures évolutions du projet.
-   **[Guide de Sécurité](docs/SECURITY.md)** : Pour comprendre les mesures de sécurité intégrées.
-   **[Changelog](CHANGELOG.md)** : Pour suivre l'historique des changements.

---

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à ouvrir une issue ou une pull request sur le dépôt GitHub.

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

---

Développé avec ❤️ par [eflexcloud](https://github.com/digitaleflex). 