# Image de base WordPress avec PHP 8.2 et FPM
FROM wordpress:php8.2-fpm-alpine

# Définition des variables d'environnement avec valeurs par défaut
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_PASSWORD
ARG REDIS_PASSWORD
ARG WORDPRESS_DB_PASSWORD

# Installation des dépendances
RUN apk add --no-cache \
    libzip-dev \
    zip \
    unzip \
    git \
    imagemagick-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    autoconf \
    dpkg-dev \
    dpkg \
    file \
    g++ \
    gcc \
    libc-dev \
    make \
    pkgconf \
    re2c

# Installation des extensions PHP
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    gd \
    mysqli \
    pdo_mysql \
    exif \
    fileinfo

# Installation de Redis
RUN apk add --no-cache redis \
    && pecl install redis \
    && docker-php-ext-enable redis

# Optimisation de la configuration PHP
RUN echo "memory_limit=512M" > /usr/local/etc/php/conf.d/memory-limit.ini \
    && echo "upload_max_filesize=128M" > /usr/local/etc/php/conf.d/upload-limit.ini \
    && echo "post_max_size=128M" >> /usr/local/etc/php/conf.d/upload-limit.ini \
    && echo "max_execution_time=600" > /usr/local/etc/php/conf.d/time-limit.ini

# Configuration de la langue française pour WordPress
RUN echo "define('WPLANG', 'fr_FR');" > /usr/local/etc/php/conf.d/wordpress-lang.ini \
    && echo "define('WP_LANG_DIR', '/var/www/html/wp-content/languages');" >> /usr/local/etc/php/conf.d/wordpress-lang.ini

# Création des répertoires WordPress
RUN mkdir -p /var/www/html/wp-content/uploads \
    /var/www/html/wp-content/plugins \
    /var/www/html/wp-content/themes \
    /var/www/html/wp-content/languages \
    /var/log/php

# Configuration des permissions de base
RUN chown -R www-data:www-data /var/www/html /var/log/php \
    && find /var/www/html -type d -exec chmod 755 {} \; \
    && find /var/www/html -type f -exec chmod 644 {} \; \
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
