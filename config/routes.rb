Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resource :user, only: [:show]
  
  root 'pages#home'

  resources :clients do
    resources :computers, only: [:new, :create, :index, :edit, :update, :show, :destroy]

    # Route pour l'impression des équipements d'un client (HTML et PDF)
    member do
      get 'print_equipments', to: 'clients#print_equipments', defaults: { format: :html }  # Route pour HTML par défaut
      get 'print_equipments.pdf', to: 'clients#print_equipments', as: :print_equipments_pdf, defaults: { format: :pdf }  # Route pour PDF
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
