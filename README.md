# ParcInventory

## Description
ParcInventory est une application Ruby on Rails conçue pour aider les informaticiens à réaliser un inventaire du parc informatique de leurs clients. Les utilisateurs peuvent créer un compte, ajouter des clients et gérer les postes informatiques pour chaque client.

## Table des Matières
1. [Fonctionnalités](#fonctionnalités)
2. [Installation](#installation)
3. [Utilisation](#utilisation)
4. [Contribuer](#contribuer)
5. [Licence](#licence)
6. [Auteurs et Crédit](#auteurs-et-crédit)

## Fonctionnalités
- Création de compte utilisateur
- Gestion des clients
- Ajout et gestion des postes informatiques pour chaque client
- Interface utilisateur simple et intuitive

## Installation
Pour installer et configurer l'application localement, suivez les étapes ci-dessous :

### Prérequis
- Ruby 3.1.2
- Rails 7.1.3.4
- MySQL

### Étapes
1. Clonez le dépôt :
    ```sh
    git clone https://github.com/esbo22/parcinventory.git
    cd parcinventory
    ```

2. Installez les dépendances :
    ```sh
    bundle install
    ```

3. Configurez la base de données :
    ```sh
    rails db:create
    rails db:migrate
    rails db:seed
    ```

4. Lancez le serveur :
    ```sh
    rails server
    ```

5. Ouvrez votre navigateur et accédez à `http://localhost:3000`.

## Utilisation
1. Créez un compte en cliquant sur "S'inscrire".
2. Connectez-vous avec vos informations d'identification.
3. Ajoutez un nouveau client en naviguant vers "Clients" et en cliquant sur "Ajouter un client".
4. Ajoutez des postes informatiques pour chaque client en accédant aux détails du client et en cliquant sur "Ajouter un poste informatique".

## Contribuer
Les contributions sont les bienvenues ! Pour signaler un bug ou demander une fonctionnalité, veuillez ouvrir une issue. Pour contribuer au code :
1. Forkez le dépôt.
2. Créez une branche pour votre fonctionnalité (`git checkout -b feature/nouvelle-fonctionnalite`).
3. Commitez vos modifications (`git commit -am 'Ajout de nouvelle fonctionnalité'`).
4. Poussez la branche (`git push origin feature/nouvelle-fonctionnalite`).
5. Ouvrez une Pull Request.

## Licence
Ce projet est sous une licence restrictive. Vous pouvez utiliser ce code à titre personnel et à des fins de développement. Toute utilisation commerciale sans l'autorisation explicite du propriétaire du dépôt est interdite.

## Auteurs et Crédit
- **esbo22** - *Développeur principal* - [Profil GitHub](https://github.com/esbo22)
- Merci à [Ruby on Rails](https://rubyonrails.org/) pour leur framework fantastique.
