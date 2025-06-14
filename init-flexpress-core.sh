#!/bin/bash

# Nom du projet
PROJECT_NAME="flexpress-core"

# Créer les dossiers principaux
mkdir -p $PROJECT_NAME/{wordpress/wp-content/{themes,plugins,uploads},mysql/data,config,extensions,scripts,docs}

# Fichiers racine
touch $PROJECT_NAME/{docker-compose.yml,Dockerfile,.env,.env.example,.gitignore,Makefile}

# Fichiers de documentation
touch $PROJECT_NAME/docs/{README.md,CHANGELOG.md,ARCHITECTURE.md}

# Fichiers de configuration
touch $PROJECT_NAME/config/{php.ini,apache.conf}

# Script d'installation WP-CLI
cat << 'EOF' > $PROJECT_NAME/scripts/install.sh
#!/bin/bash

echo "Installation WordPress avec WP-CLI"

docker exec -it wordpress bash -c "
  wp core download &&
  wp config create --dbname=\$MYSQL_DATABASE --dbuser=\$MYSQL_USER --dbpass=\$MYSQL_PASSWORD --dbhost=mysql &&
  wp core install --url=localhost --title='FlexPress Site' --admin_user=admin --admin_password=admin123 --admin_email=admin@example.com
"
EOF
chmod +x $PROJECT_NAME/scripts/install.sh

# Fichier .gitignore
cat << EOF > $PROJECT_NAME/.gitignore
.env
mysql/data/
wordpress/wp-content/uploads/
EOF

# Makefile de base
cat << 'EOF' > $PROJECT_NAME/Makefile
up:
	docker compose up -d

down:
	docker compose down

build:
	docker compose build

reset:
	docker compose down -v && docker compose up -d --build
EOF

echo "✅ Structure du projet '$PROJECT_NAME' créée avec succès."
