# Architecture de FlexPress Core

FlexPress Core est basé sur une architecture de microservices conteneurisés, orchestrée par Docker Compose. L'objectif est de fournir un environnement de développement et de production pour WordPress qui soit à la fois robuste, sécurisé et performant.

## Services Principaux

L'architecture s'articule autour de trois services principaux :

1.  **`nginx`** :
    -   **Rôle** : Serveur web et reverse proxy.
    -   **Image** : `nginx:alpine`
    -   **Description** : Il reçoit les requêtes HTTP/S et les transmet au service `wordpress` (PHP-FPM). Il est également responsable de servir les fichiers statiques (CSS, JS, images) directement pour une meilleure performance. La configuration est optimisée pour WordPress et inclut des en-têtes de sécurité.

2.  **`wordpress`** :
    -   **Rôle** : Serveur d'application PHP.
    -   **Image** : Image customisée basée sur `wordpress:php8.2-fpm-alpine`.
    -   **Description** : Ce service exécute le code de WordPress. Il est construit à partir d'un `Dockerfile` customisé qui ajoute les extensions PHP nécessaires et applique des configurations d'optimisation. Il ne communique pas directement avec l'extérieur mais répond aux requêtes de Nginx via FastCGI.

3.  **`mysql`** :
    -   **Rôle** : Base de données.
    -   **Image** : `mysql:8.0`
    -   **Description** : Ce service gère la base de données de WordPress. Les données sont persistantes grâce à un volume Docker, ce qui garantit qu'elles ne sont pas perdues lors du redémarrage des conteneurs.

## Réseau

-   Un réseau unique (`flexpress-network`) est créé pour isoler les services. Seul le service `nginx` expose des ports vers l'extérieur (80 et 443). Les autres services ne sont accessibles qu'à l'intérieur de ce réseau, renforçant ainsi la sécurité.

## Volumes

-   **`wordpress_data`** : Contient les fichiers de WordPress (core, thèmes, plugins, uploads). Partagé entre `nginx` et `wordpress`.
-   **`mysql_data`** : Stocke les données de la base de données MySQL.
-   **`nginx_logs`** / **`mysql_logs`** : Volumes dédiés pour les logs des services.