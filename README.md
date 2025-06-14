# 🚀 FlexPress Core

## 📝 Description
FlexPress Core est une infrastructure WordPress dockerisée, modulaire et orientée DevOps. Ce projet fournit une base solide pour le déploiement de sites WordPress avec une approche moderne et sécurisée.

## 🎯 Objectifs
- Environnements propres et isolés
- Architecture modulaire par services
- Sécurité intégrée dès la conception
- Facilité de déploiement et maintenance

## 🏗️ Architecture
```
flexpress-core/
├── docker-compose.yml    # Orchestration principale
├── Dockerfile           # Image WordPress customisée
├── .env                # Variables d'environnement
├── config/             # Configuration PHP, Apache, etc.
├── wordpress/wp-content/ # Personnalisations WordPress
├── mysql/data/         # Persistance base de données
├── extensions/         # Services optionnels
├── scripts/            # Automatisations
├── docs/               # Documentation
└── Makefile           # Commandes DevOps
```

## 🚀 Installation Rapide

1. Cloner le repository :
```bash
git clone https://github.com/digitaleflex/flexpress-core.git
cd flexpress-core
```

2. Configurer l'environnement :
```bash
cp .env.example .env
# Éditer .env avec vos paramètres
```

3. Lancer l'infrastructure :
```bash
make up
```

## 🔧 Fonctionnalités

- 🐳 Environnement Docker complet
- 🔐 Sécurité renforcée
- 📦 Modularité des services
- 🧪 Healthchecks intégrés
- 🔄 Scripts idempotents
- 📄 Documentation détaillée

## 🛠️ Prérequis

- Docker
- Docker Compose
- Make (optionnel)
- Git

## 📚 Documentation

La documentation complète est disponible dans le dossier `docs/` :
- Architecture détaillée
- Guide d'installation
- Bonnes pratiques
- Changelog

## 🤝 Contribution

Les contributions sont les bienvenues ! Consultez notre guide de contribution dans `docs/CONTRIBUTING.md`.

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 👥 Auteurs

- **Eurin HASH / E-FLEX CLOUD**

## 📞 Support

Pour toute question ou support, veuillez ouvrir une issue sur GitHub.

---
*Dernière mise à jour : 14/06/2025*

## 🌟 Fonctionnalités

- 🚀 **Performance Optimisée**
  - Cache Redis intégré
  - OPcache JIT activé
  - Compression GZIP
  - Cache des fichiers statiques

- 🔒 **Sécurité Renforcée**
  - Génération automatique de mots de passe
  - Gestion des permissions automatisée
  - Support SSL/TLS
  - Isolation des services

- 🛠 **Maintenance Simplifiée**
  - Healthchecks automatisés
  - Logs centralisés
  - Scripts d'automatisation
  - Sauvegardes facilitées

- 📦 **Modularité**
  - Architecture extensible
  - Services isolés
  - Configuration centralisée
  - Volumes persistants

## 🚀 Démarrage Rapide

1. **Cloner le dépôt**
```bash
git clone https://github.com/votre-org/flexpress-core.git
cd flexpress-core
```

2. **Générer la configuration**
```bash
chmod +x scripts/generate-env.sh
./scripts/generate-env.sh
```

3. **Démarrer l'infrastructure**
```bash
docker compose up -d
```

4. **Configurer les permissions**
```bash
./scripts/fix-permissions.sh
```

## 📚 Documentation

- [Guide de Configuration](docs/CONFIGURATION.md)
- [Guide de Déploiement](docs/DEPLOYMENT.md)
- [Guide de Sécurité](docs/SECURITY.md)
- [Guide de Maintenance](docs/MAINTENANCE.md)

## 🛠 Prérequis

- Docker Engine 24.0.0+
- Docker Compose v2.20.0+
- Git
- 4GB RAM minimum
- 20GB espace disque minimum

## 🔧 Configuration

### Variables d'Environnement

Le fichier `.env` est généré automatiquement avec des valeurs sécurisées :

```env
# MySQL
MYSQL_DATABASE=wordpress
MYSQL_USER=wordpress
MYSQL_PASSWORD=<généré-automatiquement>
MYSQL_ROOT_PASSWORD=<généré-automatiquement>

# Redis
REDIS_PASSWORD=<généré-automatiquement>

# WordPress
WP_ENV=development
WP_DEBUG=true
WP_TITLE="Mon Site WordPress"
WP_URL=http://localhost
WP_ADMIN_USER=admin
WP_ADMIN_PASSWORD=<à-définir>
WP_ADMIN_EMAIL=admin@example.com
```

### Services

- **WordPress** : PHP 8.2 avec FPM
- **Nginx** : Serveur web optimisé
- **MySQL** : Base de données
- **Redis** : Cache objet

## 🔒 Sécurité

- Mots de passe générés automatiquement
- Permissions WordPress automatisées
- Support SSL/TLS
- Isolation des services
- Protection des fichiers sensibles

## 🚀 Performance

- Cache Redis pour les objets
- OPcache JIT pour PHP
- Cache des fichiers statiques
- Compression GZIP
- Optimisations MySQL

## 🛠 Maintenance

### Logs

Les logs sont centralisés dans `/var/log/` :
- Nginx : `/var/log/nginx/`
- PHP : `/var/log/php/`
- MySQL : `/var/log/mysql/`

### Healthchecks

Tous les services incluent des healthchecks automatiques.

### Sauvegarde

```bash
docker compose exec mysql mysqldump -u root -p wordpress > backup.sql
```

## 🤝 Contribution

Les contributions sont les bienvenues ! Consultez notre [guide de contribution](CONTRIBUTING.md).

## 📝 Licence

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

## 📞 Support

Pour toute question ou problème :
- Ouvrir une issue sur GitHub
- Consulter la [documentation](docs/)
- Contacter l'équipe de support

---

Développé avec ❤️ par l'équipe FlexPress

---
*Dernière mise à jour : 14/06/2025* 