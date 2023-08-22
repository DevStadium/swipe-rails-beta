Rails.application.routes.draw do
  resources :accounts
  devise_for :users
  root "welcome#index"

  get 'dashboard', to: 'dashboard#index'
end
