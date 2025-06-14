# Guide de Configuration FlexPress Core

Ce guide détaille la configuration de FlexPress Core, une infrastructure WordPress modulaire et Dockerisée.

## Table des matières
1. [Prérequis](#prérequis)
2. [Installation](#installation)
3. [Configuration](#configuration)
4. [Sécurité](#sécurité)
5. [Performance](#performance)
6. [Maintenance](#maintenance)
7. [Dépannage](#dépannage)

## Prérequis

### Système
- Docker Engine 24.0.0+
- Docker Compose v2.20.0+
- Git
- 4GB RAM minimum
- 20GB espace disque minimum

### Ports requis
- 80 (HTTP)
- 443 (HTTPS)
- 3306 (MySQL, optionnel en production)

## Installation

1. Cloner le dépôt :
```bash
git clone https://github.com/votre-org/flexpress-core.git
cd flexpress-core
```

2. Générer le fichier .env :
```bash
chmod +x scripts/generate-env.sh
./scripts/generate-env.sh
```

3. Démarrer l'infrastructure :
```bash
docker compose up -d
```

## Configuration

### Variables d'environnement

Le fichier `.env` contient toutes les configurations essentielles :

```env
# MySQL
MYSQL_DATABASE=wordpress
MYSQL_USER=wordpress
MYSQL_PASSWORD=<généré-automatiquement>
MYSQL_ROOT_PASSWORD=<généré-automatiquement>

# WordPress
WP_ENV=development
WP_DEBUG=true
WP_TITLE="Mon Site WordPress"
WP_URL=http://localhost
WP_ADMIN_USER=admin
WP_ADMIN_PASSWORD=<à-définir>
WP_ADMIN_EMAIL=admin@example.com

# Nginx
NGINX_HTTP_PORT=80
NGINX_HTTPS_PORT=443
NGINX_SSL_CERT=/etc/nginx/ssl/cert.pem
NGINX_SSL_KEY=/etc/nginx/ssl/key.pem

# Timezone
TZ=UTC

# Limites
PHP_MEMORY_LIMIT=512M
PHP_UPLOAD_MAX_FILESIZE=128M
PHP_POST_MAX_SIZE=128M
PHP_MAX_EXECUTION_TIME=600
```

### Configuration PHP

Les paramètres PHP sont configurés dans `config/php/uploads.ini` :

```ini
; Uploads
upload_max_filesize = 128M
post_max_size = 128M
memory_limit = 512M
max_execution_time = 600

; Cache
opcache.enable = 1
opcache.memory_consumption = 256
opcache.max_accelerated_files = 10000
opcache.jit = 1235
opcache.jit_buffer_size = 128M

; Extensions
extension=gd
extension=mysqli
extension=pdo_mysql
extension=zip
extension=exif
extension=fileinfo
extension=imagick
```

### Configuration MySQL

La configuration MySQL se trouve dans `config/mysql/my.cnf` :

```ini
[mysqld]
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci
innodb_buffer_pool_size = 1G
innodb_log_file_size = 256M
innodb_flush_log_at_trx_commit = 2
max_connections = 1000
max_allowed_packet = 64M
```

## Sécurité

### Génération des mots de passe

Les mots de passe sont générés automatiquement lors de la première installation :

```bash
./scripts/generate-env.sh
```

Ce script :
- Génère des mots de passe sécurisés pour MySQL
- Configure les permissions du fichier .env (600)
- Crée les variables d'environnement nécessaires

### Permissions WordPress

Les permissions sont gérées automatiquement :

```bash
./scripts/fix-permissions.sh
```

Ce script configure :
- Permissions des fichiers (644)
- Permissions des répertoires (755)
- Permissions spéciales pour wp-config.php (600)
- Propriété des fichiers (www-data)

### SSL/TLS

Pour activer HTTPS :

1. Placer les certificats dans `config/nginx/ssl/`
2. Configurer les chemins dans `.env`
3. Redémarrer Nginx :
```bash
docker compose restart nginx
```

## Performance

### Cache

Le système utilise plusieurs niveaux de cache :


2. **OPcache** pour le cache PHP
3. **Nginx** pour le cache des fichiers statiques

### Optimisations

- Compression GZIP activée
- Cache des fichiers statiques
- Mise en cache des requêtes MySQL
- JIT PHP activé

## Maintenance

### Logs

Les logs sont centralisés dans `/var/log/` :

- Nginx : `/var/log/nginx/`
- PHP : `/var/log/php/`
- MySQL : `/var/log/mysql/`

### Healthchecks

Tous les services incluent des healthchecks :

```yaml
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost/health"]
  interval: 30s
  timeout: 10s
  retries: 3
```

### Sauvegarde

Pour sauvegarder les données :

```bash
docker compose exec mysql mysqldump -u root -p wordpress > backup.sql
```

## Dépannage

### Vérification des logs

```bash
# Logs Nginx
docker compose logs nginx

# Logs PHP
docker compose logs wordpress

# Logs MySQL
docker compose logs mysql
```

### Redémarrage des services

```bash
# Redémarrer un service
docker compose restart [service]

# Redémarrer tous les services
docker compose restart
```

### Vérification des permissions

```bash
# Vérifier les permissions WordPress
./scripts/fix-permissions.sh

# Vérifier les permissions des volumes
docker compose exec wordpress ls -la /var/www/html
```

### Problèmes courants

1. **Erreur de connexion MySQL**
   - Vérifier les variables d'environnement
   - Vérifier les logs MySQL
   - Redémarrer le service

2. **Problèmes de permissions**
   - Exécuter le script de permissions
   - Vérifier les logs PHP
   - Vérifier les propriétaires des fichiers

3. **Problèmes SSL**
   - Vérifier les certificats
   - Vérifier la configuration Nginx
   - Vérifier les permissions des certificats

---
*Dernière mise à jour : 14/06/2025 14:02:00 UTC+1 (Africa/Porto-Novo)* 