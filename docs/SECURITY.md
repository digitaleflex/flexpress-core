# 🛡️ Guide de Sécurité de FlexPress Core

La sécurité n'est pas une option, c'est une fondation. Ce document décrit les mesures de sécurité intégrées dans FlexPress Core et les bonnes pratiques recommandées pour maintenir un environnement sécurisé.

---

## 1. Sécurité par la Conception

FlexPress Core a été conçu avec le principe de "sécurité par défaut".

### Isolation des Services

L'architecture utilise un réseau Docker privé pour isoler les services critiques :

-   **`nginx`** : C'est le seul service exposé à Internet. Il agit comme un reverse proxy et un pare-feu applicatif de première ligne.
-   **`wordpress`** : Ce conteneur exécute PHP-FPM et n'est accessible que depuis le conteneur Nginx. Il n'a aucun port exposé sur l'hôte ou sur Internet.
-   **`mysql`** : La base de données est uniquement accessible depuis le conteneur WordPress. Elle est complètement isolée du monde extérieur.

Cette segmentation réduit considérablement la surface d'attaque.

### Gestion des Secrets

Les informations sensibles (mots de passe, clés API) sont gérées de manière sécurisée :

-   **Fichier `.env`** : Toutes les informations sensibles sont stockées dans un fichier `.env` qui est **exclu du contrôle de version** (via `.gitignore`).
-   **Génération Automatisée** : Les scripts `generate-env.sh` et `generate-env.ps1` créent automatiquement des mots de passe forts et uniques pour la base de données lors de l'initialisation.

---

## 2. Sécurité Applicative (WordPress)

La sécurité de l'infrastructure ne remplace pas les bonnes pratiques au niveau de l'application.

### Mots de Passe Administrateur

**C'est votre responsabilité la plus importante.** Vous **devez** définir un mot de passe administrateur (`WP_ADMIN_PASSWORD`) fort et unique dans votre fichier `.env`.

### Mises à Jour Régulières

Gardez toujours à jour :
-   Le cœur de WordPress.
-   Vos thèmes.
-   Vos plugins.

Les vulnérabilités dans des composants obsolètes sont la cause n°1 des piratages de sites WordPress.

### Permissions des Fichiers

Des permissions de fichiers correctes sont essentielles pour empêcher l'exécution de code malveillant ou la modification non autorisée de fichiers. Bien que Docker gère une partie de l'isolation, il est recommandé de s'assurer que les permissions au sein du volume `wordpress/` sont restrictives.

---

## 3. Sécurité du Serveur Web (Nginx)

La configuration de Nginx inclut plusieurs mesures de sécurité par défaut :

-   **En-têtes de Sécurité** : Des en-têtes HTTP comme `X-Frame-Options`, `X-XSS-Protection`, et `Strict-Transport-Security` (si SSL est activé) sont configurés pour protéger contre les attaques courantes (Clickjacking, XSS).
-   **Protection des Fichiers Sensibles** : L'accès direct aux fichiers comme `.htaccess`, `wp-config.php` ou les logs est bloqué.
-   **Limitation des Méthodes HTTP** : Seules les méthodes HTTP nécessaires (GET, POST, HEAD) sont généralement autorisées.

---

## 4. Recommandations Supplémentaires

-   **Sauvegardes Régulières** : Mettez en place une stratégie de sauvegarde régulière de votre base de données et de vos fichiers.
-   **Surveillance** : Surveillez les logs (Nginx, PHP) pour détecter toute activité suspecte.
-   **Plugin de Sécurité WordPress** : Envisagez d'utiliser un plugin de sécurité réputé (ex: Wordfence, Sucuri) pour une protection supplémentaire (pare-feu applicatif, scan de malwares).
