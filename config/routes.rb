Rails.application.routes.draw do
  # Utilisation d'un contrôleur personnalisé pour les inscriptions Devise
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # Définir la route root vers l'action home de PagesController
  root 'pages#home'

  # Routes imbriquées pour les clients et les équipements
  resources :clients do
    resources :computers, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  end

  # Routes générales pour les équipements
  resources :computers, only: [:show, :edit, :update, :destroy] # Actions générales pour les équipements

  # Route temporaire pour la page de connexion future pointant vers clients#index
  get 'login', to: 'clients#index'
end
