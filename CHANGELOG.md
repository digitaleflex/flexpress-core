# Changelog

Tous les changements notables de ce projet seront documentés dans ce fichier.

Le format est basé sur [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/),
et ce projet adhère au [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.3] - 2025-06-14 18:31:00 UTC+1 (Africa/Porto-Novo)

### Supprimé
- Retrait de l'installation et de la configuration automatiques de Redis. L'intégration est désormais manuelle pour plus de flexibilité.
- Suppression de l'installation de l'extension PhpRedis du Dockerfile.
- Suppression du pré-téléchargement du plugin Redis Object Cache.

### Modifié
- Le `Dockerfile` a été nettoyé de toutes les dépendances et configurations relatives à Redis.

## [1.0.2] - 2025-06-14 15:00:00 UTC+1 (Africa/Porto-Novo)

### Ajouté
- Configuration optimisée de Nginx avec FastCGI Cache
- Nouveau fichier `config/nginx/fastcgi-cache.conf` pour la gestion du cache
- Headers de sécurité renforcés dans la configuration Nginx
- Compression Gzip pour les fichiers statiques
- Rate limiting pour la protection contre les attaques DDoS

### Modifié
- Optimisation de la configuration Nginx dans `config/nginx/default.conf`
- Amélioration des paramètres de cache pour les fichiers statiques
- Configuration des buffers et timeouts FastCGI
- Gestion des logs Nginx avec buffer

### Sécurité
- Ajout de headers de sécurité (X-Frame-Options, X-XSS-Protection, etc.)
- Protection contre les attaques par déni de service
- Cache désactivé pour les pages d'administration WordPress
- Cache désactivé pour les utilisateurs connectés

### Performance
- Mise en place du cache FastCGI (10GB max, 60min TTL)
- Optimisation des buffers pour les requêtes FastCGI
- Compression Gzip pour réduire la taille des fichiers
- Cache intelligent des fichiers statiques

## [1.0.1] - 2025-06-14 14:30:00 UTC+1 (Africa/Porto-Novo)

### Ajouté
- Script de génération automatique de mots de passe sécurisés
- Script de gestion des permissions WordPress
- Support SSL pour Nginx
- Volumes persistants pour les logs
- Healthchecks pour tous les services

### Modifié
- Augmentation des limites PHP pour les thèmes et plugins lourds
  - Mémoire maximale : 512M
  - Taille d'upload : 128M
  - Temps d'exécution : 600s
- Optimisation des configurations de cache
  - OPcache JIT activé
  - Buffer size augmenté
  - Nombre de fichiers accélérés augmenté
- Amélioration de la sécurité des conteneurs
  - Permissions plus restrictives
  - Gestion des logs centralisée

### Sécurité
- Génération automatique de mots de passe sécurisés
- Configuration des permissions WordPress automatisée
- Protection des fichiers sensibles
- Isolation des services dans le réseau Docker

### Performance
- Optimisation des configurations PHP
- Amélioration des performances MySQL
- Cache des fichiers statiques

### Documentation
- Mise à jour des guides de configuration
- Instructions de déploiement mises à jour
- Guide de sécurité renforcé

## [1.0.0] - 2025-06-14 14:02:00 UTC+1 (Africa/Porto-Novo)

### Ajouté
- Structure initiale du projet
- Configuration Docker de base
- Architecture modulaire
- Documentation de base
- Scripts d'automatisation
- Support pour les extensions
- Système de healthcheck
- Configuration de sécurité de base

### Sécurité
- Variables d'environnement pour les secrets
- Validation des plugins WordPress
- Support pour Let's Encrypt
- Configuration sécurisée de MySQL

### Documentation
- README.md complet
- Structure de documentation dans docs/
- Guide d'installation
- Architecture détaillée

---
*Note : Toutes les dates sont en UTC+1 (Africa/Porto-Novo)* 