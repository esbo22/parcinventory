Rails.application.routes.draw do
  # Utilisation d'un contrôleur personnalisé pour les inscriptions Devise
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # Définir la route root vers l'action home de PagesController
  root 'pages#home'

  # Autres routes
  resources :computers
  resources :clients

  # Route temporaire pour la page de connexion future pointant vers computers#index
  get 'login', to: 'computers#index'
end
