Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'pages#home'

  resources :clients do
    resources :computers, only: [:new, :create, :index, :edit, :update, :show, :destroy]

    member do
      get 'print_equipments', to: 'clients#print_equipments'
    end

    collection do
      get :autocomplete
    end
  end

  resources :computers, only: [:show, :edit, :update, :destroy]

  get 'login', to: 'clients#index'
end
