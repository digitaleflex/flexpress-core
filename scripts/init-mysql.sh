#!/bin/bash

set -e

# Attendre que MySQL soit prêt
until mysqladmin ping -h"localhost" -u"root" -p"${MYSQL_ROOT_PASSWORD}" --silent; do
    echo "En attente de MySQL..."
    sleep 2
done

# Créer la base de données et l'utilisateur WordPress
mysql -h"localhost" -u"root" -p"${MYSQL_ROOT_PASSWORD}" << EOF
-- Créer la base de données si elle n'existe pas
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Créer l'utilisateur s'il n'existe pas
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED WITH mysql_native_password BY '${MYSQL_PASSWORD}';

-- Accorder tous les privilèges sur la base de données à l'utilisateur
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';

-- Appliquer les modifications
FLUSH PRIVILEGES;

-- Afficher les utilisateurs et leurs privilèges (pour le débogage)
SELECT user, host FROM mysql.user;
SHOW GRANTS FOR '${MYSQL_USER}'@'%';
EOF

echo "Initialisation de MySQL terminée avec succès"