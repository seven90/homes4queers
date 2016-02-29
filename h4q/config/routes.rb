Rails.application.routes.draw do
  root 'listings#index'

  resources :users do
    resources :comments
  end
  resources :listings do
    resources :comments
  end
  resources :user_sessions, only: [:new, :create, :destroy]

  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout
end
