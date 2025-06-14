#!/bin/bash

# Définition des répertoires WordPress
WP_ROOT="/var/www/html"
WP_CONTENT="$WP_ROOT/wp-content"
WP_UPLOADS="$WP_CONTENT/uploads"
WP_PLUGINS="$WP_CONTENT/plugins"
WP_THEMES="$WP_CONTENT/themes"

# Création des répertoires s'ils n'existent pas
mkdir -p $WP_UPLOADS $WP_PLUGINS $WP_THEMES

# Définition des permissions pour les fichiers
find $WP_ROOT -type f -exec chmod 644 {} \;

# Définition des permissions pour les répertoires
find $WP_ROOT -type d -exec chmod 755 {} \;

# Permissions spéciales pour wp-config.php
if [ -f "$WP_ROOT/wp-config.php" ]; then
    chmod 600 $WP_ROOT/wp-config.php
fi

# Permissions pour les répertoires d'upload
chmod -R 775 $WP_UPLOADS
chown -R www-data:www-data $WP_UPLOADS

# Permissions pour les plugins et thèmes
chmod -R 775 $WP_PLUGINS $WP_THEMES
chown -R www-data:www-data $WP_PLUGINS $WP_THEMES

# Permissions pour les logs
mkdir -p /var/log/php
chmod 755 /var/log/php
chown www-data:www-data /var/log/php

echo "Permissions WordPress configurées avec succès." 