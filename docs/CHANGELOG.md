# Changelog

## [1.0.1] - 2024-03-09

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

## [1.0.0] - 2024-03-08

### Ajouté
- Configuration initiale du projet
- Docker Compose avec services WordPress, MySQL, Redis et Nginx
- Scripts d'initialisation et de configuration
- Documentation de base

### Sécurité
- Gestion des variables d'environnement
- Configuration sécurisée de MySQL
- Protection de base de Nginx

### Performance
- Configuration de base de Redis
- Optimisation PHP-FPM
- Configuration de base de Nginx
