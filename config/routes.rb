Rails.application.routes.draw do
  devise_for :users
  # Défini la route root vers l'action home de PagesController
  root 'pages#home'
  # Autres routes
  resources :computers
  # Route temporaire pour la page de connexion future pointant vers computers#index
  get 'login', to: 'computers#index'
end
