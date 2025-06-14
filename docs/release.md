# Journal des Modifications

Toutes les modifications notables apportées à ce projet seront documentées dans ce fichier.

Le format est basé sur [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [v1.0.0] - 2025-06-14

### Added (Ajouté)

-   **Infrastructure Docker complète :** Mise en place d'un environnement de production avec Nginx, WordPress (PHP-FPM) et MySQL, orchestré par Docker Compose.
-   **Configuration Automatisée :** Création d'un script `generate-env.sh` pour générer automatiquement un fichier `.env` avec des secrets sécurisés.
-   **Pipeline CI/CD :** Implémentation de workflows GitHub Actions pour :
    -   Le linting de code avec Super-Linter.
    -   Le scan de sécurité des images Docker avec Trivy.
    -   Le build et le push automatisés des images vers Docker Hub.
-   **Versioning Sémantique :** Configuration du workflow pour taguer automatiquement les images Docker (`latest`, `x.y.z`, `x.y`) en fonction des branches et des tags Git.
-   **Documentation Professionnelle :** Rédaction d'un `README.md` complet et structuré.
-   **Licence :** Ajout d'une licence MIT pour clarifier les droits d'utilisation.

### Fixed (Corrigé)

-   **Accès Base de Données :** Résolution des erreurs d'accès "Access Denied" pour l'utilisateur MySQL en synchronisant les credentials via des variables d'environnement.
-   **Conflit de Port :** Changement du port Nginx par défaut de 80 à 9000 pour éviter les conflits sur la machine hôte.
-   **Affichage des Erreurs PHP :** Suppression des avertissements PHP en production en utilisant la variable d'environnement `WORDPRESS_DEBUG=false`.
-   **Scan de Sécurité CI/CD :** Correction du workflow Trivy qui échouait en lui passant un seul tag d'image à analyser.

### Changed (Modifié)

-   **Sécurité des Secrets :** Remplacement de tous les mots de passe et secrets hardcodés dans `docker-compose.yml` et les scripts par des références aux variables d'environnement.
