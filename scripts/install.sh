#!/bin/bash

echo "Installation WordPress avec WP-CLI"

docker exec -it wordpress bash -c "
  wp core download &&
  wp config create --dbname=\$MYSQL_DATABASE --dbuser=\$MYSQL_USER --dbpass=\$MYSQL_PASSWORD --dbhost=mysql &&
  wp core install --url=localhost --title='FlexPress Site' --admin_user=admin --admin_password=admin123 --admin_email=admin@example.com
"
