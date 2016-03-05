Rails.application.routes.draw do
  root 'listings#index'

  resources :users do
    member do
      post 'favourite'
      delete 'unfavourite'
    end
    resources :comments
    resources :favourites, only: [:index]
  end
  resources :listings do
    member do
      post 'favourite'
      delete 'unfavourite'
    end
    resources :comments
  end
  resources :user_sessions, only: [:new, :create, :destroy]

  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout
end
