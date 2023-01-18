# La décadanse
Agenda culturel local

La décadanse présente une sélection d'événements culturels accessibles et locaux (actuellement pour les régions de Genève et Lausanne), donnant la possibilité aux organisateurs d'ajouter leurs propres événements et de gérer leur fiche de présentation.

La majeur partie du site est composée d'un agenda permettant de naviguer dans les événements passés ou futurs. Chacun de ceux-ci a sa fiche détaillée avec la possibilité donnée aux personnes inscrites d'y laisser un commentaire. Une rubrique Lieux répertorie des endroits où se déroulent des événements, et une page similaire liste les organisateurs d'événements.

Une section d'administration permet de gérer les différentes contenus du site : utilisateurs, événements, lieux, organisateurs, etc.

## Installation

1. cloner la branche `master`
1. créer le fichier de configuration du site en copiant le modèle `app/env_model.php` vers `app/env.php`
1. dans un fichier de configuration Apache (`.htaccess` ou autre) définir le décalage horaire par défaut PHP, par ex. :
    ```
    php_value date.timezone 'Europe/Zurich'
    ```
1. créer une base de données et y importer `config/ladecadanse.sql`
1. dans votre `app/env.php` saisir les valeurs pour (davantage d'explication et exemples se trouvent dans ce fichier `env.php`) :
    - `$rep_absolu`
    - `$url_domaine`
    - `$url_site` 
    - les informations de connexion à la base de données
    - `MASTER_KEY` : un mot de passe "magique" qui fonctionne pour tous les identifiants
    - (optionel) les clés Google pour [Maps](https://developers.google.com/maps/documentation/javascript/get-api-key) (cartes des lieux) et [Recaptcha 3](https://www.google.com/recaptcha/intro/v3.html) (formulaire Proposer un événement)
1. dans la table `personne` créer le user *admin* (groupe : 1) qui vous servira à gérer le site :
    
    ```INSERT INTO `personne` (`idPersonne`, `pseudo`, `mot_de_passe`, `cookie`, `session`, `ip`, `groupe`, `statut`, `nom`, `prenom`, `affiliation`, `adresse`, `region`, `telephone`, `email`, `URL`, `signature`, `avec_affiliation`, `notification_commentaires`, `gds`, `actif`, `remarque`, `dateAjout`, `date_derniere_modif`) VALUES (NULL, 'admin', '', '', '', '', '1', 'actif', '', '', '', '', 'ge', '', '', '', 'pseudo', 'non', 'non', '', '1', '', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000');```
1. afin d'avoir accès à l'administration, se connecter avec ce login *admin* et le mot de passe `MASTER_KEY` défini plus haut 
1. (optionnel) installer [Pear Mail](https://pear.php.net/package/Mail/) pour que l'envoi d'emails fonctionne (les `require_once Mail.php;` dans le code)

Testé avec Apache 2.4, PHP 7.4, MariaDB 10/MySQL 5.7
