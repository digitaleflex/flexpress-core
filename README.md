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