Rails.application.routes.draw do
  resources :computers
  root 'computers#index'
end
