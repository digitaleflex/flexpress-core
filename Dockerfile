# Image de base WordPress avec PHP 8.2 et FPM
FROM wordpress:php8.2-fpm-alpine

# Combinez les commandes RUN pour réduire le nombre de couches de l'image.
# Installez les dépendances, les extensions PHP, puis nettoyez les dépendances de build.
RUN set -eux; \
    \
    # Dépendances nécessaires uniquement pour la compilation (seront supprimées)
    apk add --no-cache --virtual .build-deps \
        autoconf \
        dpkg \
        dpkg-dev \
        file \
        freetype-dev \
        g++ \
        gcc \
        imagemagick-dev \
        libc-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libzip-dev \
        make \
        pkgconf \
        re2c; \
    \
    # Dépendances d'exécution (gardées dans l'image finale)
    apk add --no-cache \
        curl \
        git \
        unzip \
        zip; \
    \
    # Configuration et installation des extensions PHP
    docker-php-ext-configure gd --with-freetype --with-jpeg; \
    docker-php-ext-install -j"$(nproc)" \
        exif \
        fileinfo \
        gd \
        mysqli \
        pdo_mysql; \
    \
    # Nettoyage des dépendances de build
    apk del .build-deps; \
    \
    # Création d'un fichier de configuration PHP unique pour les optimisations
    { \
        echo "memory_limit=512M"; \
        echo "upload_max_filesize=128M"; \
        echo "post_max_size=128M"; \
        echo "max_execution_time=600"; \
    } > /usr/local/etc/php/conf.d/zz-flexpress-optimizations.ini; \
    \
    # Configuration de la langue : la meilleure pratique est d'utiliser la variable d'environnement
    # WORDPRESS_LANG='fr_FR' dans votre fichier .env ou docker-compose.yml.
    # Ce fichier est laissé en exemple, mais les lignes sont commentées.
    { \
        echo "; define('WPLANG', 'fr_FR');"; \
        echo "; define('WP_LANG_DIR', '/var/www/html/wp-content/languages');"; \
    } > /usr/local/etc/php/conf.d/zz-wordpress-lang-example.ini

# Création des répertoires WordPress
RUN mkdir -p /var/www/html/wp-content/uploads \
    /var/www/html/wp-content/plugins \
    /var/www/html/wp-content/themes \
    /var/www/html/wp-content/languages \
    /var/log/php

# Configuration des permissions de base
RUN chown -R www-data:www-data /var/www/html /var/log/php \
    && find /var/www/html -type d -exec chmod 755 {} \; \
    && find /var/www/html -type f -exec chmod 644 {} \;

# Configuration des permissions pour wp-content
RUN chown -R www-data:www-data /var/www/html/wp-content \
    && chmod -R 775 /var/www/html/wp-content/uploads \
    && chmod -R 775 /var/www/html/wp-content/plugins \
    && chmod -R 775 /var/www/html/wp-content/themes \
    && chmod -R 775 /var/www/html/wp-content/languages

# Configuration du healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD php -v || exit 1

# Utilisation d'un utilisateur non-root
USER www-data

# Exposition du port PHP-FPM
EXPOSE 9000

# Commande par défaut
CMD ["php-fpm"]
