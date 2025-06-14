#!/bin/bash

# Fonction pour générer un mot de passe sécurisé
generate_password() {
    openssl rand -base64 32 | tr -dc 'a-zA-Z0-9!@#$%^&*()_+' | head -c 32
}

# Création du fichier .env
cat > .env << EOL
# Configuration MySQL
MYSQL_DATABASE=flexpress
MYSQL_USER=flexpress_user
MYSQL_PASSWORD=$(generate_password)
MYSQL_ROOT_PASSWORD=$(generate_password)


# Configuration WordPress
WORDPRESS_DEBUG=false

# Configuration Nginx
NGINX_PORT=9000
NGINX_SSL_PORT=443

# Configuration des timezones
TZ=Africa/Porto-Novo

# Configuration des limites
PHP_MEMORY_LIMIT=512M
PHP_UPLOAD_MAX_FILESIZE=128M
PHP_POST_MAX_SIZE=128M
EOL

# Définition des permissions
chmod 600 .env

echo "Fichier .env généré avec succès avec des mots de passe sécurisés."
echo "N'oubliez pas de sauvegarder ces informations de manière sécurisée." 