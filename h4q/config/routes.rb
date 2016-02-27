Rails.application.routes.draw do
  root 'listings#index'

  resources :users
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :listings

  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout
end
