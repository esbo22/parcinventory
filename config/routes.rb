Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'pages#home'

  resources :clients do
    resources :computers, only: [:new, :create, :index, :edit, :update, :show, :destroy]

    # Route pour l'impression des équipements d'un client
    member do
      get 'print_equipments', to: 'clients#print_equipments'
    end

    # Route pour l'autocomplétion
    collection do
      get :autocomplete
    end
  end

  resources :computers, only: [:show, :edit, :update, :destroy]

  # Route pour le login
  get 'login', to: 'clients#index'
end
